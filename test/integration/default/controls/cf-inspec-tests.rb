# Load Terraform attributes
project_id = attribute('project_id')
service_account_email = attribute('service_account_email')
available_memory_mb = attribute('available_memory_mb')
timeout = attribute('timeout')
region = attribute('region')

event_configs = {
  'http_python' => {
    'function_name' => attribute('http_function_name_python'),
    'runtime' => attribute('http_runtime_python'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('http_description_python'),
    'trigger_type' => attribute('http_trigger_type_python'),
    'trigger_source' => attribute('http_trigger_source_python'),
    'ingress_settings' => attribute('http_ingress_settings_python'),
    'max_instances' => attribute('http_max_instances_python'),
    'kms_key_name' => attribute('http_kms_key_name_python'),
    'vpc_connector_egress_settings' => attribute('http_vpc_connector_egress_settings_python')
  },
  'http_dotnet' => {
    'function_name' => attribute('http_function_name_dotnet'),
    'runtime' => attribute('http_runtime_dotnet'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('http_description_dotnet'),
    'trigger_type' => attribute('http_trigger_type_dotnet'),
    'trigger_source' => attribute('http_trigger_source_dotnet'),
    'ingress_settings' => attribute('http_ingress_settings_dotnet'),
    'max_instances' => attribute('http_max_instances_dotnet'),
    'kms_key_name' => attribute('http_kms_key_name_dotnet'),
    'vpc_connector_egress_settings' => attribute('http_vpc_connector_egress_settings_dotnet')
  },
  'pubsub_python' => {
    'function_name' => attribute('pubsub_function_name_python'),
    'runtime' => attribute('pubsub_runtime_python'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('pubsub_description_python'),
    'trigger_type' => attribute('pubsub_trigger_type_python'),
    'trigger_source' => attribute('pubsub_trigger_source_python'),
    'ingress_settings' => attribute('pubsub_ingress_settings_python'),
    'max_instances' => attribute('pubsub_max_instances_python'),
    'kms_key_name' => attribute('pubsub_kms_key_name_python'),
    'vpc_connector_egress_settings' => attribute('pubsub_vpc_connector_egress_settings_python')
  },
  'pubsub_dotnet' => {
    'function_name' => attribute('pubsub_function_name_dotnet'),
    'runtime' => attribute('pubsub_runtime_dotnet'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('pubsub_description_dotnet'),
    'trigger_type' => attribute('pubsub_trigger_type_dotnet'),
    'trigger_source' => attribute('pubsub_trigger_source_dotnet'),
    'ingress_settings' => attribute('pubsub_ingress_settings_dotnet'),
    'max_instances' => attribute('pubsub_max_instances_dotnet'),
    'kms_key_name' => attribute('pubsub_kms_key_name_dotnet'),
    'vpc_connector_egress_settings' => attribute('pubsub_vpc_connector_egress_settings_dotnet')
  },
  'storage_python' => {
    'function_name' => attribute('storage_function_name_python'),
    'runtime' => attribute('storage_runtime_python'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('storage_description_python'),
    'trigger_type' => attribute('storage_trigger_type_python'),
    'trigger_source' => attribute('storage_trigger_source_python'),
    'ingress_settings' => attribute('storage_ingress_settings_python'),
    'max_instances' => attribute('storage_max_instances_python'),
    'kms_key_name' => attribute('storage_kms_key_name_python'),
    'vpc_connector_egress_settings' => attribute('storage_vpc_connector_egress_settings_python')
  },
  'storage_dotnet' => {
    'function_name' => attribute('storage_function_name_dotnet'),
    'runtime' => attribute('storage_runtime_dotnet'),
    'vpc_connector' => attribute('vpc_connector'),
    'description' => attribute('storage_description_dotnet'),
    'trigger_type' => attribute('storage_trigger_type_dotnet'),
    'trigger_source' => attribute('storage_trigger_source_dotnet'),
    'ingress_settings' => attribute('storage_ingress_settings_dotnet'),
    'max_instances' => attribute('storage_max_instances_dotnet'),
    'kms_key_name' => attribute('storage_kms_key_name_dotnet'),
    'vpc_connector_egress_settings' => attribute('storage_vpc_connector_egress_settings_dotnet')
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
      its('available_memory_mb') { should eq available_memory_mb }
      its('timeout') { should eq "#{timeout}s" } # Add 's' to match the format
      its('description') { should eq event_config['description'] }
      its('trigger_type') { should eq event_config['trigger_type'] }
      its('trigger_source') { should eq event_config['trigger_source'] }
      its('ingress_settings') { should eq event_config['ingress_settings'] }
      its('max_instances') { should eq event_config['max_instances'] }
      its('kms_key_name') { should eq event_config['kms_key_name'] }
      its('vpc_connector_egress_settings') { should eq event_config['vpc_connector_egress_settings'] }

      # HTTP trigger
      if event_type.start_with?('http')
        context "when using an HTTP trigger" do
          it "should have an HTTPS trigger" do
            expect(subject.https_trigger).not_to be_nil
            expect(subject.https_trigger.security_level).to eq event_config['trigger_type']
            expect(subject.https_trigger.url).to eq event_config['trigger_source']
          end
        end
      # Pub/Sub trigger
      elsif event_type.start_with?('pubsub')
        context "when using a Pub/Sub trigger" do
          it "should have an event trigger" do
            expect(subject.event_trigger).not_to be_nil
            expect(subject.event_trigger.event_type).to eq event_config['trigger_type']
            expect(subject.event_trigger.resource).to eq event_config['trigger_source']
          end
        end
      # Storage trigger
      elsif event_type.start_with?('storage')
        context "when using a Storage trigger" do
          it "should have an event trigger" do
            expect(subject.event_trigger).not_to be_nil
            expect(subject.event_trigger.event_type).to eq event_config['trigger_type']
            expect(subject.event_trigger.resource).to eq event_config['trigger_source']
          end
        end
      end
    end
  end
end
