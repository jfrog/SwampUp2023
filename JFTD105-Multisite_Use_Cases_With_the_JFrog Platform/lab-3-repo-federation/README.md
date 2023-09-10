### Prerequisites
# LAB 0 - Configure JFrog CLI

# use CLI to generate access_token
Create an access token for the user with the swampup@jfrog.com username.
- Run
```
jf rt atc swampup
```
- Run
```
jf rt atc swampup@jfrog.com
```

# use cURL 

 1. Replace {SwampUp JPD host} with valid value
 2. Replace {SwampUp JPD Edge host} with valid value
 3. Replace {SwampUp Second JPD host} with valid value
 4. Replace <TOKEN> with the access-token generated from the previous step
 5. Copy and execute the below command in the terminal

curl --location --request PUT 'https://{SwampUp JPD host}.jfrog.io/artifactory/api/repositories/jftd105lab3-maven-dev-local' \
-H "Content-Type: application/json" \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
"key": "jftd105lab3-maven-dev-local",
"rclass": "federated",
"packageType": "maven",
"members": [
{
"url": "https://{SwampUp JPD host}.jfrog.io/artifactory/jftd105lab3-maven-dev-local",
"enabled": true
},
{
"url": "https://{SwampUp EDGE host}.jfrog.io/artifactory/jftd105lab3-maven-dev-local",
"enabled": true
},
{
"url": "https://{SwampUp Second JPD host}.jfrog.io/artifactory/jftd105lab3-maven-dev-local",
"enabled": true
}
]
}'

## RUN SCRIPT[Optional]
- Run 
```
sh lab_3_federation_rescue.sh
```