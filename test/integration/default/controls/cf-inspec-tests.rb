# Load Terraform attributes
project_id = attribute('project_id')
service_account_email = attribute('service_account_email')
available_memory_mb = attribute('available_memory_mb')
timeout = attribute('timeout')
region = attribute('region')
docker_registry = attribute('docker_registry')
docker_repository = attribute('docker_repository')

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
    describe google_cloudfunctions_cloud_function(project: project_id, location: region, name: event_config['function_name']) do
      it { should exist }
      its('name') { should eq function_name }
      its('runtime') { should eq event_config['runtime'] }
      its('status') { should eq "ACTIVE" }
      its('service_account_email') { should eq service_account_email }
      its('available_memory_mb') { should eq available_memory_mb }
      its('timeout') { should eq "#{timeout}s" } # Add 's' to match the format
      its('description') { should eq event_config['description'] }
    end
  end
end

control "cloud_functions_script" do
  title "Check Cloud Functions Script"

  event_configs.each do |event_type, event_config|
    describe "Script output for #{event_type} event" do
      function_name = event_config['function_name']
      script_path = File.expand_path(File.join(File.dirname(__FILE__), 'get_cloud_function_details.sh'))
      script_output = %x{sh #{script_path} #{project_id} #{region} #{function_name}}

      puts "Script output for #{event_type} event:"
      puts script_output

      context "when using #{event_type} event" do
        it "should have the expected value for ingress settings" do
          ingress_settings = script_output.match(/ingressSettings: (.+)/)&.captures&.first
          expect(ingress_settings).to eq(event_config['ingress_settings'])
        end

        it "should have the expected value for max instances" do
          max_instances = script_output.match(/maxInstances: (.+)/)&.captures&.first
          expect(max_instances.to_i).to eq(event_config['max_instances'])
        end        

        it "should have the expected value for vpc connector egress settings" do
          vpc_connector_egress_settings = script_output.match(/vpcConnectorEgressSettings: (.+)/)&.captures&.first
          expect(vpc_connector_egress_settings).to eq(event_config['vpc_connector_egress_settings'])
        end

        it "should have the expected value for docker registry" do
          docker_registry_cli = script_output.match(/dockerRegistry: (.+)/)&.captures&.first
          expect(docker_registry_cli).to eq(docker_registry)
        end

        it "should have the expected value for docker repository" do
          docker_repository_cli= script_output.match(/dockerRepository: (.+)/)&.captures&.first
          expect(docker_repository_cli).to eq(docker_repository)
        end

        it "should have the expected value for https trigger URL" do
          if event_type == 'http_python' || event_type == 'http_dotnet'
            https_trigger_url = script_output.match(/httpsTrigger:\s+url: (.+)/)&.captures&.first
            expect(https_trigger_url).to eq(event_config['https_trigger_url'])
          end
        end

        it "should have the expected value for ingress settings value" do
          ingress_settings_value = script_output.match(/ingressSettings: (.+)/)&.captures&.first
          expect(ingress_settings_value).to eq(event_config['ingress_settings'])
        end

        # it "should have the expected value for labels" do
        #   labels = script_output.scan(/labels:\n\s+(\S+): (\S+)/).to_h
        #   expect(labels).to eq(event_config['labels'])
        # end

        if event_type == 'http_python' || event_type == 'http_dotnet'
          it "should include 'httpsTrigger:' and exclude 'eventTrigger:'" do
            expect(script_output).to include('httpsTrigger:')
            expect(script_output).not_to include('eventTrigger:')
          end
        elsif event_type == 'pubsub_python' || event_type == 'pubsub_dotnet' || event_type == 'storage_python' || event_type == 'storage_dotnet'
          it "should include 'eventTrigger:'" do
            expect(script_output).to include('eventTrigger:')
          end
        end
      end
    end
  end
end
