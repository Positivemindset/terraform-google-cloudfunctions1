#!/bin/bash
project_id=${1}
region=${2}
function_name=${3}

gcloud functions describe "${function_name}" \
  --project="${project_id}" \
  --region="${region}" \
