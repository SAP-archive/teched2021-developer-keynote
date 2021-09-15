# The power and flexibility of CLI tools

> Open on Houseguest full screen in the Diary Room

My housemates, for the most part, are using all these fancy graphical user interfaces in their daily work. What they don't realise is that this is slowing them down, and they could work at the speed of thought by using command line tools to get things done. What's more, they keep you focused, can be combined, and most powerfully, can be scripted. With tools for the command line interface - the CLI - from SAP, I get to operate in the most powerful and flexible environment - the shell.

For the House project, I have to set up an Event Mesh based messaging service in a separate, self-contained subaccount on the SAP Business Technology Platform. With the btp CLI combined with the Cloud Foundry CLI, this is super easy, and ready for automation too if I needed it. Let's get to it.

> Transition to demo in the main screen and Diary Room with Houseguest in small window in corner. On screen is a terminal window with the output of `btp` showing, with me logged in, but only the global account targeted, like this:

```
; btp
SAP BTP command line interface (client v2.8.0)

Usage: btp [OPTIONS] ACTION [GROUP/OBJECT] [PARAMS]

CLI server URL:                    https://cpcli.cf.eu10.hana.ondemand.com (server v2.8.0)
User:                              P2003480923 (qmacro+green@gmail.com)
Configuration:                     /home/user/.config/btp/config.json
Autocomplete script (bash):        /home/user/.config/btp/autocomplete/scripts/sapbtpcli-autocomplete.plugin.sh
RCFile path (bash):                /home/user/.bashrc

Current target:
  Global account (subdomain: 7348430ctrial-ga)

Tips:
  For information about the targeting mechanism, use 'btp --help target'.
  To display general help, use 'btp --help'.

OK
```

I'm logged into my btp global account, so I take a quick look at the hierarchy I have right now:

```
; btp get accounts/global-account --show-hierarchy
Showing details for global account 59b766f4-8c29-403e-a6ce-7b7d6a7ecaab...

├─ 7348430ctrial (59b766f4-8c29-403e-a6ce-7b7d6a7ecaab - global account)
│  ├─ trial (937f3cd4-5d33-461a-bece-89b943d19c50 - subaccount)

type:            id:                                    display name:   parent id:
global account   59b766f4-8c29-403e-a6ce-7b7d6a7ecaab   7348430ctrial
subaccount       937f3cd4-5d33-461a-bece-89b943d19c50   trial           59b766f4-8c29-403e-a6ce
;
```

> I'm using my [truncated flavour](https://qmacro.org/autodidactics/2021/09/15/using-functions-more/) of `btp` here.

Before I go any further, I check to make sure I have an entitlement for the messaging service. Let's see what I have at the global account level:

```
; btp list accounts/entitlement

Showing entitlements for subaccount 937f3cd4-5d33-461a-bece-89b943d19c50:

service name                                        service plan              quota
ppservice-inbound-trial                             trial                     1
ppservice-odata-trial                               default                   1
business-rules                                      lite                      1
transport                                           standard                  1
...
```

> Show entire list, which is long.

Wow, that's a lot of good stuff. Let me narrow down the search:

```
; btp list accounts/entitlement | grep -i messaging
enterprise-messaging                                dev                       1
enterprise-messaging-hub                            standard                  1
```

There it is, `enterprise-messaging` with the `dev` plan, lovely.

I'm going to want to allocate that entitlement and quota to another separate subaccount that I'm about to create, within a directory, so I'll just remove it from this trial subaccount so I have it ready to reassign in a minute. I'll do this by setting the quota amount to zero.

I'll need to specify the GUID of the trial subaccount, which I can get with a little script. Already you can see I'm able to level up my skills and efficiency by getting this CLI to work _with_ me, not against me, making me more efficient. And the btp CLI, like other SAP command line tools, lends itself nicely to that purpose.

Here's the GUID for the trial subaccount:

```
; bsg trial
937f3cd4-5d33-461a-bece-89b943d19c50
```

Right, let's specify that in the assignment to zero:

```
; btp assign accounts/entitlement --for-service enterprise-messaging --plan dev --amount 0 --to-subaccount $(bsg trial)

Assigning global account entitlement to subaccount...

global account id:   59b766f4-8c29-403e-a6ce-7b7d6a7ecaab
subaccount id:       937f3cd4-5d33-461a-bece-89b943d19c50
service/app name:    enterprise-messaging
service plan name:   dev
quota:               0
enable:              false

Command runs in the background.
Use 'btp list accounts/entitlement' to verify status.


OK
```

OK! Now I'm ready to create the new House project subaccount, in a directory, and use Event Mesh there.
