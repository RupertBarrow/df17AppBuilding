sfdx plugins:link node_modules/shane-sfdx-plugins
sfdx plugins:link node_modules/@salesforce/analytics
sfdx plugins:link node_modules/@mshanemc/sfdx-migration-automatic
sfdx force:auth:jwt:grant --clientid 3MVG9T46ZAw5GTfVmqwOUu5uB8FfzS7gF66q9owrLElV_6zoyEF7jS8lNI2tjr3Me1xxVIG.IxeSfP74vUPld -u rupert.barrow@lilo.org --jwtkeyfile /app/tmp/server.key -s -a

sfdx shane:org:create -f config/project-scratch-def.json -s -d 1 --userprefix crash --userdomain course.org
sfdx force:source:push
sfdx force:user:permset:assign -n VolunteeringApp
sfdx force:data:tree:import -p data/masterImportPlan.json
sfdx force:apex:execute -f scripts/setup.cls
sfdx shane:user:password:set -p sfdx1234 -g User -l User
sfdx force:org:open
