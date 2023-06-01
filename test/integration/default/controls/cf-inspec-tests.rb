# Load Terraform attributes
project_id = attribute('project_id')
service_account_email = attribute('service_account_email')
available_memory_mb = attribute('available_memory_mb')
timeout = attribute('timeout')

event_configs = {
  'http_python' => {
    'function_name' => attribute('http_python.function_name'),
    'runtime' => attribute('http_python.runtime'),
    'description' => attribute('http_python.description'),
    'trigger_type' => attribute('http_python.trigger_type'),
    'trigger_source' => attribute('http_python.trigger_source'),
    'ingress_settings' => attribute('http_python.ingress_settings'),
    'max_instances' => attribute('http_python.max_instances'),
    'kms_key_name' => attribute('http_python.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('http_python.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('http_python.vpc_connector'),
    'trigger_event_resource' => attribute('http_python.trigger_event_resource')
  },
  'http_dotnet' => {
    'function_name' => attribute('http_dotnet.function_name'),
    'runtime' => attribute('http_dotnet.runtime'),
    'description' => attribute('http_dotnet.description'),
    'trigger_type' => attribute('http_dotnet.trigger_type'),
    'trigger_source' => attribute('http_dotnet.trigger_source'),
    'ingress_settings' => attribute('http_dotnet.ingress_settings'),
    'max_instances' => attribute('http_dotnet.max_instances'),
    'kms_key_name' => attribute('http_dotnet.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('http_dotnet.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('http_dotnet.vpc_connector'),
    'trigger_event_resource' => attribute('http_dotnet.trigger_event_resource')
  },
  'pubsub_python' => {
    'function_name' => attribute('pubsub_python.function_name'),
    'runtime' => attribute('pubsub_python.runtime'),
    'description' => attribute('pubsub_python.description'),
    'trigger_type' => attribute('pubsub_python.trigger_type'),
    'trigger_source' => attribute('pubsub_python.trigger_source'),
    'ingress_settings' => attribute('pubsub_python.ingress_settings'),
    'max_instances' => attribute('pubsub_python.max_instances'),
    'kms_key_name' => attribute('pubsub_python.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('pubsub_python.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('pubsub_python.vpc_connector'),
    'trigger_event_resource' => attribute('pubsub_python.trigger_event_resource')
  },
  'pubsub_dotnet' => {
    'function_name' => attribute('pubsub_dotnet.function_name'),
    'runtime' => attribute('pubsub_dotnet.runtime'),
    'description' => attribute('pubsub_dotnet.description'),
    'trigger_type' => attribute('pubsub_dotnet.trigger_type'),
    'trigger_source' => attribute('pubsub_dotnet.trigger_source'),
    'ingress_settings' => attribute('pubsub_dotnet.ingress_settings'),
    'max_instances' => attribute('pubsub_dotnet.max_instances'),
    'kms_key_name' => attribute('pubsub_dotnet.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('pubsub_dotnet.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('pubsub_dotnet.vpc_connector'),
    'trigger_event_resource' => attribute('pubsub_dotnet.trigger_event_resource')
  },
  'storage_python' => {
    'function_name' => attribute('storage_python.function_name'),
    'runtime' => attribute('storage_python.runtime'),
    'description' => attribute('storage_python.description'),
    'trigger_type' => attribute('storage_python.trigger_type'),
    'trigger_source' => attribute('storage_python.trigger_source'),
    'ingress_settings' => attribute('storage_python.ingress_settings'),
    'max_instances' => attribute('storage_python.max_instances'),
    'kms_key_name' => attribute('storage_python.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('storage_python.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('storage_python.vpc_connector'),
    'trigger_event_resource' => attribute('storage_python.trigger_event_resource')
  },
  'storage_dotnet' => {
    'function_name' => attribute('storage_dotnet.function_name'),
    'runtime' => attribute('storage_dotnet.runtime'),
    'description' => attribute('storage_dotnet.description'),
    'trigger_type' => attribute('storage_dotnet.trigger_type'),
    'trigger_source' => attribute('storage_dotnet.trigger_source'),
    'ingress_settings' => attribute('storage_dotnet.ingress_settings'),
    'max_instances' => attribute('storage_dotnet.max_instances'),
    'kms_key_name' => attribute('storage_dotnet.kms_key_name'),
    'vpc_connector_egress_settings' => attribute('storage_dotnet.vpc_connector_egress_settings'),
    'vpc_connector' => attribute('storage_dotnet.vpc_connector'),
    'trigger_event_resource' => attribute('storage_dotnet.trigger_event_resource')
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
          end
        end
      # Pub/Sub trigger
      elsif event_type.start_with?('pubsub')
        context "when using a Pub/Sub trigger" do
          it "
