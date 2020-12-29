#!/bin/bash
#export ENVIRONMENT=${ENVIRONMENT:-stage}
#export SLACK_WEBHOOK_URL= # Set at runtime
#export SLACK_TOKEN= # Set at runtime
#export SLACK_CHANNEL='#channel'
#export SLACK_TITLE='Automated Tests'
#export SLACK_HEADER=${ENVIRONMENT}

# Use this to update slack
# function slackReport {
#     export HTML_FILE=$(ls newman/*.html)
#     curl https://slack.com/api/files.upload -F token="${SLACK_TOKEN}" -F channels="${SLACK_CHANNEL}" -F SLACK_TITLE="Automation Report for ${SERVICENAME} - ${ENVIRONMENT}" -F file=@"${HTML_FILE}"
# }


#newman run ${SERVICENAME}-Automation.postman_collection.json -r htmlextra,cli,slack -e ${ENVIRONMENT}.postman_environment.json --bail
# if [ "$?" -ne "0" ]; then
#     curl -X POST --data-urlencode "payload={\"channel\": \"${SLACK_CHANNEL}\",\"attachments\": [{\"mrkdwn_in\": [\"text\"],\"color\": \"#FF0000\", \"pretext\": \"There was a problem with ${SERVICENAME}\",\"title\": \"${SERVICENAME} Automated Testing\",\"text\": \"There appears to be a problem with ${SERVICENAME} in the ${ENVIRONMENT} environment\",\"fields\": [{\"title\": \"Please check the report\",}],}]}" ${SLACK_WEBHOOK_URL}
#     slackReport
#     exit 1
# else 
#   curl -X POST --data-urlencode "payload={\"channel\": \"${SLACK_CHANNEL}\",\"attachments\": [{\"mrkdwn_in\": [\"text\"],\"color\": \"#008000\", \"pretext\": \"Tests passed for ${SERVICENAME}\",\"title\": \"${SERVICENAME} Automated Testing\",\"text\": \"All tests have passed for ${SERVICENAME} in the ${ENVIRONMENT} environment\",\"fields\": [{\"title\": \"Please view the report for more details\",}],}]}" ${SLACK_WEBHOOK_URL}
#   slackReport
#   exit 0
# fi

newman run DemoService.postman_collection.json -r htmlextra,cli --bail