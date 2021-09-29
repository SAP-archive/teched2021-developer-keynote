# Intro

For the most part, my housemates all like to use fancy graphical user interfaces but don't realise how much that slows them down. They don't know about the power of the shell.

In the house I've been tasked with creating a Cloud Foundry messaging service based on SAP Event Mesh, in a separate self-contained subaccount and I'm going to use the btp CLI to do it. Super easy, fast and so scriptable!

# Look at global account & hierarchy

So I've started out by checking what I have in my fresh global account - just a trial subaccount so far.

# Check for entitlement & get subaccount GUID

I check for an entitlement to the messaging service (dev plan) and I can see it's assigned to that trial subaccount, which has a GUID I can get with a little script like this, that uses the btp CLI itself.

# Unassign entitlement from trial subaccount

First I'm going to unassign that entitlement from the trial subaccount so I can use it elsewhere shortly. I can do that by setting the quota amount to zero. There, done.

# Create a directory, asking for help along the way

Now I can create a directory, getting the btp CLI to help me work out what to do. I can even ask for help, and there's plenty of it! So now I know I need to specify a display name and the features I want - all of them, of course!

When that's done I can take another look at the hierarchy and I can see that the directory is there, lovely!

# Reassigning the entitlement to the new directory

And I can reassign the entitlement to this new directory. Done! Let's check that - I'll list the entitlements and look for the ones assigned to the TECHEDHOUSE directory. There it is.

# Selecting a region and creating a subaccount

So now I want to create that new separate subaccount in this directory, but in what region? Let's have a look. Yep, I can see that Cloud Foundry is available in all these regions, I'll go for US10.

In constructing the command to create the subaccount, I specify that region, a display name, err, do I want beta features, yes please! I need to give it a subdomain, I'll generate a GUID for that; and finally I want to specify that it should be created within my new directory.

There we go, creation underway. Let's have a quick check. And there it is - within the TECHEDHOUSE directory, perfect.

# Assigning the entitlement to the subaccount

Now I can just recall the previous assignment command to give the entitlement to this new subaccount. Done!

# Targeting the subaccount

A lot of btp CLI commands are aimed at the subaccount level; right now my btp CLI is targeting my global account only, by default. A quick invocation of my bgu script adds my new subaccount to the target. Super!

# Creating the Cloud Foundry environment instance

We saw that the US10 region supported Cloud Foundry; I can confirm that by listing the environments that are available to us in this subaccount now. Yep. Nice.

So now, again with a little help from the btp CLI autocompletion, I can easily find my way to create an instance of such an environment. Now, let's have a look what I might need to specify - right, the environment, in the form of type, service and plan, and I need to pass an environment-specific parameter in JSON format to specify the name of the instance. DONE!

And that's pretty much all I need to do. I can check the list of environment instances in my subaccount like this, and there it is, in all its glory.

# Wrapping up

Beyond how quick that was, just imagine building that power into automated scripts. The world is your lobster, and of course, the future is terminal!
