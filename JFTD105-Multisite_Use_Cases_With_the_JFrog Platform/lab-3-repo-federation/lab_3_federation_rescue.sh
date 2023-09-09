#Clean the old repositories if any
sh cleanup.sh



curl --location --request PUT 'https://{SwampUp JPD host}/artifactory/api/repositories/jftd105lab3-maven-dev-local' \
-H "Content-Type: application/json" \
--header 'Authorization: Bearer <TOKEN>' \
--data @template-federated-repo.json

