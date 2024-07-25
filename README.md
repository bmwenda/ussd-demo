## About
This is simple demo that demonstrates how USSD works. This demo uses [Africa's Talking USSD](https://africastalking.com/ussd).

## Technical details
The USSD communication service happens over GSM. Messages are sent from the user's mobile device using a service code to the operator who can then forward the message via a callback to a remote service/third party. The remote service receives the request and returns the appropriate response to the operator as plain text which the operator sends to the user's device for display.

USSD message format is not standardized and varies between operators.

## How it works
Review documentation - https://developers.africastalking.com/docs/ussd/overview
Simple walkthrough - https://developers.africastalking.com/tutorials/building-an-offline-account-management-application-using-ussd

The third party typically defines a USSD menu which is just a plain text with options. Nested menus will be separated by asterisks by the operator e.g `1*1*2`. The application will receive this text along with other parameters set by the operator e.g mobile number of the user, session id, service code etc and execute the correct command.

## Using this repo
Set up the repo and run `rails server`. The USSD callback endpoint is at `/callback`. If you want to view this in action, use [this simular](https://developers.africastalking.com/simulator). You will need to have set up a developer account on AF to set up a [sandbox](https://account.africastalking.com/apps/sandbox) where you can get a service code for testing as well as set the callback url for testing. You can tunnel the request to local dev using ngrok.
