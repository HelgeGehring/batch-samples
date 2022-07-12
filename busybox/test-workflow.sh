#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Get the project id"
PROJECT_ID=$(gcloud config get-value project)

echo "Deploy the workflow: $WORKFLOW_NAME"
SERVICE_ACCOUNT=workflows-batch-sa
WORKFLOW_NAME=batch-busybox
gcloud workflows deploy $WORKFLOW_NAME \
  --source workflow.yaml \
  --service-account=$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com

echo "Execute the workflow: $WORKFLOW_NAME"
gcloud workflows execute $WORKFLOW_NAME