#!/bin/bash
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610175636000"},"originCity": {"S": "Melbourne"},"destinationCity": {"S": "Sydney"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610175633000"},"originCity": {"S": "Melbourne"},"destinationCity": {"S": "Perth"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610190033000"},"originCity": {"S": "Melbourne"},"destinationCity": {"S": "Canberra"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610294800000"},"originCity": {"S": "Sydney"},"destinationCity": {"S": "Perth"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610327200000"},"originCity": {"S": "Sydney"},"destinationCity": {"S": "Melbourne"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610356000000"},"originCity": {"S": "Perth"},"destinationCity": {"S": "Darwin"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610374000000"},"originCity": {"S": "Perth"},"destinationCity": {"S": "Singapore"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610402800000"},"originCity": {"S": "Perth"},"destinationCity": {"S": "Sydney"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610446000000"},"originCity": {"S": "Melbourne"},"destinationCity": {"S": "Sydney"}}';
echo Adding record to DynamoDB
aws dynamodb put-item --profile aws-lab-env --table-name TravelBuddyTripSectors --item '{"date": {"N": "1610500000000"},"originCity": {"S": "Darwin"},"destinationCity": {"S": "Sydney"}}';
echo Done!

