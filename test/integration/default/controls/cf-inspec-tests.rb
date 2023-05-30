# frozen_string_literal: true

# Load Terraform attributes
project_id = attribute('project_id')
service_account_email = attribute('service_account_email')
available_memory_mb = attribute('available_memory_mb')
timeout = attribute('timeout')

event_configs = {
  'http' => {
    'function_name' => attribute('http_function_name_python'),
    'runtime' => attribute('http_runtime_python'),
    'vpc_connector' => attribute('vpc_connector')
  },
  'google.pubsub.topic.publish' => {
    'function_name' => attribute('pubsub_function_name_python'),
    'runtime' => attribute('pubsub_runtime_python'),
    'vpc_connector' => attribute('vpc_connector')
  },
  'google.storage.object.finalize' => {
    'function_name' => attribute('storage_function_name_python'),
    'runtime' => attribute('storage_runtime_python'),
    'vpc_connector' => attribute('vpc_connector')
  }
}

control "cloud_functions" do
  title "Check Cloud Functions"

  event_configs.each do |event_type, event_config|
    function_name = "projects/#{project_id}/locations/#{region}/functions/#{event_config['function_name']}"
    vpc_connector = "projects/#{project_id}/locations/#{region}/connectors/#{event_config['vpc_connector']}"
    describe google_cloudfunctions_cloud_function(project: project_id, location: region, name: event_config['function_name']) do
      it { should exist }
      its('name') { should eq function_name }
      its('runtime') { should eq event_config['runtime'] }
      its('status') { should eq "ACTIVE" }
      its('service_account_email') { should eq service_account_email }
      its('entry_point') { should eq entry_point }
      its('available_memory_mb') { should eq available_memory_mb }
      its('timeout') { should eq "#{timeout}s" } # Add 's' to match the format

      # HTTP trigger
      if event_type == 'http'
        context "when using an HTTP trigger" do
          it "should have an HTTPS trigger" do
            expect(subject.https_trigger).not_to be_nil
          end
        end
      # Pub/Sub and Storage triggers
      else
        context "when using a #{event_type.capitalize} trigger" do
          it "should have an event trigger" do
            expect(subject.event_trigger).not_to be_nil
            expect(subject.event_trigger.event_type).to eq event_type
          end
        end
      end
    end
  end
end

=begin # frozen_string_literal: true

# Load YAML configuration
require 'yaml'

config = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'inputs.yml'))

project_id = config['project_id']
service_account_email = config['service_account_email']
region = config['region']
entry_point = config['entry_point']
available_memory_mb = config['available_memory_mb']
timeout = config['timeout'] 

event_configs = {
  'http' => config['http'],
  'google.pubsub.topic.publish' => config['pubsub'],
  'google.storage.object.finalize' => config['storage']
}


control "cloud_functions" do
  title "Check Cloud Functions"

  event_configs.each do |event_type, event_config|
    function_name = "projects/#{project_id}/locations/#{region}/functions/#{event_config['function_name']}"
    vpc_connector = "projects/#{project_id}/locations/#{region}/connectors/#{event_config['vpc_connector']}"
    describe google_cloudfunctions_cloud_function(project: project_id, location: region, name: event_config['function_name']) do
      it { should exist }
      its('name') { should eq function_name }
      its('runtime') { should eq event_config['runtime'] }
      its('status') { should eq "ACTIVE" }
      its('service_account_email') { should eq service_account_email }
      its('entry_point') { should eq entry_point }
      its('available_memory_mb') { should eq available_memory_mb}
      its('timeout') { should eq "#{timeout}s" } # Add 's' to match the format

      # HTTP trigger
      if event_type == 'http'
        context "when using an HTTP trigger" do
          it "should have an HTTPS trigger" do
            expect(subject.https_trigger).not_to be_nil
          end
        end
      # Pub/Sub and Storage triggers
      else
        context "when using a #{event_type.capitalize} trigger" do
          it "should have an event trigger" do
            expect(subject.event_trigger).not_to be_nil
            expect(subject.event_trigger.event_type).to eq event_type
          end
        end
      end
    end
  end
end
 =end





 