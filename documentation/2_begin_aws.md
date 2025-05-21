# Task: Set up the Sparta App and Database on AWS

## Steps
1. Log in to [AWS](https://sparta-devops.signin.aws.amazon.com/console) with the username tech504-nathan and the chosen password
2. The first time you log in, you need to change the region to eu-west-1 (Ireland). Do this on the right side of the top bar, second from the end.
3. Navigate to "EC2", which is where all the VM stuff happens, and then navigate to "Instances" from there
4. If you don't have one set up on AWS, make a new key pair
   - Navigate to "key pairs" in EC2, and click "Create key pair"
   - Should be self explainatory from here
5. Make a db vm (5a) and an app vm (5b)
   - Hit "launch instances"
   - Name it something sensible
   - Select Ubuntu 22.04 for both (as there's no 20.04 for the app vm)
     - It will ask if you're sure, just say yep
   - Instance type should be t3.micro
   - Select your own key pair
   - Use the default vpc
   - Security group stuff is different for each:
     - DB:
       - Allow SSH (22) and MongoDB (27017)
     - App:
       - Allow SSH (22) and HTTP (3000) 
   - Don't forget to add your full scripts to user data
6. Test it

## Blockers
- Ubuntu 20.04 unavailable on AWS
  - Needed to rewrite app deployment script to work on Ubuntu 22.04 (added some "DEBIAN_FRONTEND=noninteractive"s)
- Security Groups
  - Security groups are confusing but I think they're basically collections of firewall rules you can apply to a VM instance
  - We had issues trying to create new SGs (still unresolved, probably quotas lol)
  - We can use "default...db..." and "default...app..."