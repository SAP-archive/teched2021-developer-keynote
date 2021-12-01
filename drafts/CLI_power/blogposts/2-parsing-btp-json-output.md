# Getting BTP resource GUIDs with the btp CLI – part 2 - JSON and jq

_In this second part of a 2-part blog post series on getting BTP resource GUIDs with the btp CLI, we look at how the CLI supports JSON output, why it's a good choice, and how to parse that._

If you haven't done already, take a look at [part 1](https://blogs.sap.com/2021/11/24/getting-btp-resource-guids-with-the-btp-cli-part-1/) before reading this part.

## The Unix philosophy and alternative output formats

The [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) is all about small programs, joined loosely together. It's about composability\*, not monolithic constructs.

\* It is not lost on me that composability is also a key feature of the functional programming paradigm, which has a similar beauty to me.

This approach to executing programs, using the power of [input / output redirection](https://tldp.org/LDP/abs/html/io-redirection.html) & pipelines and employing a handful of small, focused & powerful tools has been with us for almost half a century now and is at the heart of the dominant operating system powering the cloud.

More recently, we've been seeing a need to deal with resources which have structure that is sometimes more complex than can be described in mostly record-oriented plain text. In parallel, we're seeing declarative approaches to devops and system resource management (such as Kubernetes cluster definitions, infrastructure-as-code, and so on), with those declarative constructs expressing complex relationships and interdependencies.

The approach to encapsulate machine-readable definitions of such resources and definitions has been to employ formats such as JSON and YAML.

These formats lend themselves well to describing requirements, but also to representing structure. With the myriad resources on SAP Business Technology Platform, there are relationships that need to be expressed, conveying inherent structure that is fundamental to the understanding and operation of those resources.

And so, like many of today's command line tools, the btp CLI has the ability to express the output in a format that can reliably, predictably and cleanly convey that structure. This ability comes in the form of a general option:

```
--format json
```

You can read more about this option in the [Change the Output Format to JSON](https://help.sap.com/products/BTP/65de2977205c403bbc107264b8eccf4b/dcb85b7dea61432cbafaab4ce0ec9b08.html?locale=en-US) section in the SAP Help Portal. In our Hands-on SAP Dev show, specifically within the [SAP btp CLI](https://www.youtube.com/playlist?list=PL6RpkC85SLQDXx827kdjKc6HRvdMRZ8P5) series, there's an episode [Scripting and JSON output with btp, the SAP Business Technology Platform CLI](https://www.youtube.com/watch?v=xRmHZGk4QCU&list=PL6RpkC85SLQDXx827kdjKc6HRvdMRZ8P5&index=3) where we cover exactly this.

## Plain text vs JSON?

The question clearly arises - when should I use this option? In some philosophical ways, JSON output flows against the original Unix Philosophy, but there are most certainly pragmatic reasons why it's employed. If you're interested in reading more, I highly recommend [Bringing the Unix Philosophy to the 21st Century](https://blog.kellybrazil.com/2019/11/26/bringing-the-unix-philosophy-to-the-21st-century/) which not only is a good read, but also introduces a generic tool `jc` that is certainly fascinating and not a little thought provoking.

So, back to the question. As far as the btp CLI is concerned, let's put it this way:

* if you're using it interactively, as a human, then the plain text output is fine of course
* if you're using it non-interactively, such as in a script, then the recommendation is to use the JSON output format

For non-interactive use, where you're going to want to extract information from the output of a btp CLI command, this makes sense because the JSON output is going to be more stable, more reliable and more predictable. The plain text output may change over time, but the btp CLI team are making a big effort, and an intentional one, to provide that stability.

Of course, for quick one-off pipeline constructs on the command line, I may still use the plain text output and some traditional Unix tools to parse and extract information from the output. But for longer lived tasks, scripts and so on, I will more likely reach for the JSON output format.

## Parsing JSON on the command line

The tool of choice for parsing JSON on the command line is [jq](https://stedolan.github.io/jq/), which the author describes as "a lightweight and flexible command-line JSON processor".

I've written about `jq` before in various blog posts and also covered it in some of the Hands-on SAP Dev [show](https://blogs.sap.com/2020/11/09/an-overview-of-sap-developers-video-content/#shows) episodes - pick one that appeals to you from [this quick list of search results for mention of JSON and jq on this site](https://www.google.com/search?q=site%3Ablogs.sap.com+JSON+%22jq%22) to read more.

## Revisiting the hierarchy output

In [Getting BTP resource GUIDs with the btp CLI – part 1](https://blogs.sap.com/2021/11/24/getting-btp-resource-guids-with-the-btp-cli-part-1/), the first part of this two-part series, I explained how I used various tools to extract the GUIDs for resources shown in the output of this command:

```
btp get accounts/global-account --show-hierarchy
```

The output that this command produces looks something like this:

```
Showing details for global account af39080b-1527-40a1-b78a-3b605af7e811...

├─ c35b11e4trial (af39080b-1527-40a1-b78a-3b605af7e811 - global account)
│  ├─ trial (b6501bff-e0ac-4fdf-8898-81f305d25335 - subaccount)
│  ├─ techedhouse (e57c5b13-9480-4a68-9c04-a603d7a017a9 - directory)

type:            id:                                    display name:   parent id:
global account   af39080b-1527-40a1-b78a-3b605af7e811   c35b11e4trial
subaccount       b6501bff-e0ac-4fdf-8898-81f305d25335   trial           af39080b-...
directory        e57c5b13-9480-4a68-9c04-a603d7a017a9   techedhouse     af39080b-...
```

While it was definitely possible to consistently extract the GUIDs using the approach I took, there are other similar extraction tasks in this area that might be more troublesome.

For example, if I wanted to grab the display names of all the subaccounts in my global account, the parsing and extraction would be similar; I'd pull the output apart using whitespace as boundaries and get the job done that way. However, if a display name contained a space, which is valid, I'd start to struggle. How would I know if that space was the column boundary, or just part of the value in that column? I could resort to some sort of column-oriented slicing of the rows, but that's most likely just asking for trouble, making the parsing and extracting more brittle.

## Parsing brittle plain text output vs complex JSON output

Recently, on my Autodidactics blog, I wrote about this very challenge of parsing text output that was brittle in the post [Embracing jq and JSON](https://qmacro.org/autodidactics/2021/10/29/embracing-jq-and-json/) (see [Where I write my posts](#where-i-write-my-posts) for more info). The subject at hand was the same - the ouptut of `btp get account/global-account --show-hierarchy`, although what I was trying to extract was slightly different. Most importantly though, it demonstrated that correctly and reliably extracting a value with spaces (the resource display name 'this and that') was not straightforward.

> Some of you may think, and I'd agree, that one way that this would normally be tackled is to use tabs as field separators; this would address the situation and is indeed a standard part of how the Unix toolchain operates - look at what the default delimiter is for the [cut](https://man7.org/linux/man-pages/man1/cut.1.html) command is, for example.

What it also demonstrated was that taking the JSON output approach was preferable. Initially, as I described in that post, the prospect was a little daunting, as the structure represented in JSON consisted of nested arrays of objects. But a little digging into the [jq manual](https://stedolan.github.io/jq/manual/) showed me functions that would help out.

So what I want to do here is find a drop-in replacement for these two lines that we looked at in detail in [part 1](https://blogs.sap.com/2021/11/24/getting-btp-resource-guids-with-the-btp-cli-part-1/):

```bash
hierarchy="$(gethier)" || { btp login && hierarchy="$(gethier)"; }
read -r subtype guid <<< "$(grep -P -o "^(subaccount|directory)\s+(\S+)(?=\s+$displayname)" <<< "$hierarchy")"
```

That replacement is to use the JSON format output from the `btp` command. Let's start by examining what that looks like.

### The hierarchy in JSON format

While we know what the plain text output looks like from `btp get accounts/global-account --show-hierarchy`, the JSON output looks like this (I've removed some properties that are not relevant, to keep the JSON small enough to stare at in one go):

```json
{
  "guid": "c63c501e-e589-467d-8875-1821927ea713",
  "displayName": "1a99110dtrial",
  "children": [
    {
      "guid": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "parentGuid": "c63c501e-e589-467d-8875-1821927ea713",
      "parentType": "ROOT",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "displayName": "techedhouse",
      "stateMessage": "Directory created.",
      "subdomain": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "directoryType": "PROJECT",
      "directoryFeatures": [
        "DEFAULT",
        "ENTITLEMENTS",
        "AUTHORIZATIONS"
      ],
      "subaccounts": [
        {
          "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
          "displayName": "messaging",
          "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
          "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
          "parentType": "PROJECT",
          "parentFeatures": [
            "DEFAULT",
            "ENTITLEMENTS",
            "AUTHORIZATIONS"
          ],
          "region": "us10",
          "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
          "stateMessage": "Subaccount created."
        }
      ]
    }
  ],
  "subdomain": "1a99110dtrial-ga",
  "subaccounts": [
    {
      "guid": "00516298-b174-418e-9824-8824de04bfa3",
      "displayName": "trial",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentType": "ROOT",
      "region": "eu10",
      "subdomain": "1a99110dtrial"
    }
  ],
  "licenseType": "TRIAL"
}
```

Here are a few interesting points to notice:

* the hierarchy is expressed via sub-nodes via two properties - `children` (which are directories) and `subaccounts`
* each object that is either a directory or a subaccount has a `guid` property, which is what we're ultimately looking for
* there's a `directoryType` property on the directory objects, with a value of `PROJECT`
* the subaccount objects don't have a `directoryType` property but do have a `region` property and value

Moreover, the nesting depth of each of these directory and subaccount objects depends on where they sit in the actual hierarchy. So we have our work cut out to parse this, right?

### Rolling our jq sleeves up

Well, if you took a look at the [Embracing jq and JSON](https://qmacro.org/autodidactics/2021/10/29/embracing-jq-and-json/) post mentioned earlier, you'll know that it's not as bad as it first seems. Let's work through parsing this, step by step. The general idea is to flatten the structure, identify the objects in there, pick out the potential objects that might match, narrow down further, and then we have what we're looking for.

For the sake of exploration, let's assume we have the JSON above in a file called `hierarchy.json`.

#### Step 1 - flatten the structure

To flatten the struture, I've taken to using the `recurse` function; here's what it does (a lot of the output has been omitted for brevity):

```
; jq 'recurse' hierarchy.json
{
  "guid": "c63c501e-e589-467d-8875-1821927ea713",
  "displayName": "1a99110dtrial",
  "children": [
    {
      "guid": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "parentGuid": "c63c501e-e589-467d-8875-1821927ea713",
      "parentType": "ROOT",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "displayName": "techedhouse",
      ...
"2558794c-f8cd-4422-b071-3b21c2922a02"
"c63c501e-e589-467d-8875-1821927ea713"
"ROOT"
"c63c501e-e589-467d-8875-1821927ea713"
"techedhouse"
"Directory created."
"2558794c-f8cd-4422-b071-3b21c2922a02"
"PROJECT"
[
  "DEFAULT",
  "ENTITLEMENTS",
  "AUTHORIZATIONS"
]
"c63c501e-e589-467d-8875-1821927ea713"
"ROOT"
"eu10"
"1a99110dtrial"
"TRIAL"
```

As you can see, it descends the entire structure and emits everything it finds. This is a little too much, as non-objects are also emitted as the recursive descent progresses. Let's address that.

#### Step 2 - identify the objects

To narrow down this large amount of output to just the objects, we can use the aptly named `objects` function which will emit only objects that pass through it, discarding anything else (like those simple strings such as "ROOT", "eu10" and "1a99110dtrial" we see above). Here we go:

```
; jq 'recurse | objects'
{
  "guid": "c63c501e-e589-467d-8875-1821927ea713",
  "displayName": "1a99110dtrial",
  "children": [
    {
      "guid": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "parentGuid": "c63c501e-e589-467d-8875-1821927ea713",
      "parentType": "ROOT",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "displayName": "techedhouse",
      "stateMessage": "Directory created.",
      "subdomain": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "directoryType": "PROJECT",
      "directoryFeatures": [
        "DEFAULT",
        "ENTITLEMENTS",
        "AUTHORIZATIONS"
      ],
      "subaccounts": [
        {
          "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
          "displayName": "messaging",
          "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
          "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
          "parentType": "PROJECT",
          "parentFeatures": [
            "DEFAULT",
            "ENTITLEMENTS",
            "AUTHORIZATIONS"
          ],
          "region": "us10",
          "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
          "stateMessage": "Subaccount created."
        }
      ]
    }
  ],
  "subdomain": "1a99110dtrial-ga",
  "subaccounts": [
    {
      "guid": "00516298-b174-418e-9824-8824de04bfa3",
      "displayName": "trial",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentType": "ROOT",
      "region": "eu10",
      "subdomain": "1a99110dtrial"
    }
  ],
  "licenseType": "TRIAL"
}
{
  "guid": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "parentGuid": "c63c501e-e589-467d-8875-1821927ea713",
  "parentType": "ROOT",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "displayName": "techedhouse",
  "stateMessage": "Directory created.",
  "subdomain": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "directoryType": "PROJECT",
  "directoryFeatures": [
    "DEFAULT",
    "ENTITLEMENTS",
    "AUTHORIZATIONS"
  ],
  "subaccounts": [
    {
      "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
      "displayName": "messaging",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "parentType": "PROJECT",
      "parentFeatures": [
        "DEFAULT",
        "ENTITLEMENTS",
        "AUTHORIZATIONS"
      ],
      "region": "us10",
      "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
      "stateMessage": "Subaccount created."
    }
  ]
}
{
  "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
  "displayName": "messaging",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "parentType": "PROJECT",
  "parentFeatures": [
    "DEFAULT",
    "ENTITLEMENTS",
    "AUTHORIZATIONS"
  ],
  "region": "us10",
  "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
  "stateMessage": "Subaccount created."
}
{
  "guid": "00516298-b174-418e-9824-8824de04bfa3",
  "displayName": "trial",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentType": "ROOT",
  "region": "eu10",
  "subdomain": "1a99110dtrial"
}
```

That looks better! While the nested child objects are still expressed, each actual object in the hierarchy now appears at the top level for us to filter through.

#### Step 3 - Pick out potentially matching objects

I'm deliberately doing this in a step by step way; there are most likely more efficient ways of performing this parsing but hopefully we learn more by taking each logical piece at a time.

And here we want to filter the objects down to those that may be a valid match of a subaccount or directory. In other words, we don't want the top level node, the global account. We can achieve this by identifying our potential matches as being objects that contain a pointer to a parent (as the top level node won't have one). Let's do that now.

> I'll express the `jq` incantation across multiple lines now so it remains readable in the narrow width of this blog post rendering.

```
; jq '
recurse
| objects
| select(.parentGuid? or .parentGUID?)
' hierarchy.json
{
  "guid": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "parentGuid": "c63c501e-e589-467d-8875-1821927ea713",
  "parentType": "ROOT",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "displayName": "techedhouse",
  "stateMessage": "Directory created.",
  "subdomain": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "directoryType": "PROJECT",
  "directoryFeatures": [
    "DEFAULT",
    "ENTITLEMENTS",
    "AUTHORIZATIONS"
  ],
  "subaccounts": [
    {
      "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
      "displayName": "messaging",
      "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
      "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
      "parentType": "PROJECT",
      "parentFeatures": [
        "DEFAULT",
        "ENTITLEMENTS",
        "AUTHORIZATIONS"
      ],
      "region": "us10",
      "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
      "stateMessage": "Subaccount created."
    }
  ]
}
{
  "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
  "displayName": "messaging",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "parentType": "PROJECT",
  "parentFeatures": [
    "DEFAULT",
    "ENTITLEMENTS",
    "AUTHORIZATIONS"
  ],
  "region": "us10",
  "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
  "stateMessage": "Subaccount created."
}
{
  "guid": "00516298-b174-418e-9824-8824de04bfa3",
  "displayName": "trial",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentType": "ROOT",
  "region": "eu10",
  "subdomain": "1a99110dtrial"
}
```

Using the `select` function we can filter the objects down to only those that have a property pointing to a parent, i.e. either a `parentGuid` or `parentGUID` property, using the optional operator `?`.

> I've connected with the lovely BTP Accounts Service API team asking them about this property name discrepancy for parent GUIDs and have asked them to consider addressing it.

#### Step 4 - Narrow down to what we're looking for

Now we have just a list of subaccount and directory objects, we can comfortably filter further based on the display name given. When invoking `jq` you can pass arguments with the `--arg` option, so we can supply the chosen display name dynamically:

```
; jq --arg displayname "messaging" '
recurse
| objects
| select(.parentGuid? or .parentGUID?)
| select(.displayName == $displayname)
' hierarchy.json
{
  "guid": "3ea88c9c-010b-4bf0-9fdb-5c29c9087660",
  "displayName": "messaging",
  "globalAccountGUID": "c63c501e-e589-467d-8875-1821927ea713",
  "parentGUID": "2558794c-f8cd-4422-b071-3b21c2922a02",
  "parentType": "PROJECT",
  "parentFeatures": [
    "DEFAULT",
    "ENTITLEMENTS",
    "AUTHORIZATIONS"
  ],
  "region": "us10",
  "subdomain": "20b8636b-af4c-4c42-b79b-780763663fbb",
  "stateMessage": "Subaccount created."
}
```

Now we have exactly the object we're looking for.

#### Step 5 - Pick out the values we need

It's just remains for us to determine the values we need:

* whether it's a subaccount or a directory
* what the GUID is

We can easily pick out the GUID, it's in the `guid` property. But to determine the type, we need to introduce a bit of logic. Let's based that logic on whether the object has a `region` property - if it does, we can assume it's a subaccount, otherwise it's a directory (directories are logical constructs only).

Here's that logic in action and in context:

```
; jq --arg displayname "messaging" '
recurse
| objects
| select(.parentGuid? or .parentGUID?)
| select(.displayName == $displayname)
| [if .region? then "subaccount" else "directory" end, .guid]
' hierarchy.json
[
  "subaccount",
  "3ea88c9c-010b-4bf0-9fdb-5c29c9087660"
]
```

Getting there!

#### Step 6 - Formatting the output

To be a drop-in replacement for the previous logic, we should really be returning these in a whitespace separated construction on the same line, in the same way that they were returned in part 1 - see the [Determining the GUIDs](https://blogs.sap.com/2021/11/24/getting-btp-resource-guids-with-the-btp-cli-part-1/#determining-the-guids) section for details.

This can be done with with the `@tsv` [format string](https://stedolan.github.io/jq/manual/v1.5/#Formatstringsandescaping), which will turn an array like this into a nice tab separated values construct. When invoking this, we want to use the `--raw-output` option (short form is `-r`) to have the output written directly to standard output rather than being formatted as a JSON string inside quotes:

```
; jq --raw-output --arg displayname "messaging" '
recurse
| objects
| select(.parentGuid? or .parentGUID?)
| select(.displayName == $displayname)
| [if .region? then "subaccount" else "directory" end, .guid]
| @tsv
' hierarchy.json
subaccount      3ea88c9c-010b-4bf0-9fdb-5c29c9087660
```

In case you're wondering what we'd get without the `--raw-output` option, it's this:

```
"subaccount\t3ea88c9c-010b-4bf0-9fdb-5c29c9087660"
```

And yes, that is valid JSON, which is what `jq` will try to emit by default.

## Adjusting the btpguid script

It's time to adapt the existing `btpguid` script to use this new approach, as a drop-in replacement. The existing script in its entirety is listed in part 1, in [The btpguid script](https://blogs.sap.com/2021/11/24/getting-btp-resource-guids-with-the-btp-cli-part-1/#the-btpguid-script) section. We need to make three alterations:

* modify the `gethier` function to specify the JSON output format
* add a new function `parse` to use the `jq` script to parse the JSON hierarchy and ouptut the subtype and GUID
* modify the `read` line inside the `main` function to take input from what this new `parse` function produces

### Modifying the gethier function

We just need to add `--format json` to the invocation, so the resulting `gethier` function now looks like this:

```bash
gethier() {
  btp --format json get accounts/global-account --show-hierarchy 2> /dev/null
}
```

### Adding a new parse function

To keep things separate and more readable, the new `parse` function encapsulates the invocation of `jq` on the hierarchy data, which will now be in JSON format. The entire function expects a display name for which to search, and the JSON hierarchy data, and looks like this:

```bash
parse() {

  local displayname=$1
  local hierarchy=$2

  jq --raw-output --arg displayname "$displayname" '
    recurse
    | objects
    | select(.parentGuid? or .parentGUID?)
    | select(.displayName == $displayname)
    | [if .region? then "subaccount" else "directory" end, .guid]
    | @tsv
  ' <<< "$hierarchy"

}
```

### Adjusting the main function

Now all we need to do is adjust the line with `read` to take input from the invocation of this new `parse` function. It looks like this (the first line is unchanged, and is just listed here to provide a bit of context):

```bash
  hierarchy="$(gethier)" || { btp login && hierarchy="$(gethier)"; }
  read -r subtype guid <<< "$(parse "$displayname" "$hierarchy")"
```

## Wrapping up

So there we have it. Using the btp CLI's `--format json` option, with a bit of `jq` scripting, gives us what we want. The jq language itself is more fully formed than you might think - and given the relevance that JSON has today, both in output from tools like this, responses from API endpoints, and representations of declarative definitions for cloud services and clusters, I'd suggest that it's worth investing a little bit of time into being able to wield a few `jq` scripts, even if they are one-liners.

And talking of `jq` scripts, I'm sure there are other ways of pulling out the information from the JSON using `jq`. If you've taken a different approach, I'd love to hear about it - please share what you've done in the comments. Thanks, and happy coding!

---

<a name="where-i-write-my-posts"></a>

## Where I write my posts

Here's a short section to provide context on where my Autodidactics blog fits in. I write here on the SAP Community, but I have blogs elsewhere that I publish on too:

* my [main blog](https://qmacro.org) containing posts on all sorts of topics
* a [language ramblings blog](https://langram.org/)
* my journal entries are in a GitHub-issue based [Thinking Aloud](https://github.com/qmacro/thinking-aloud) blog
* shortish posts about stuff I learn are to be found on my [Autodidactics](https://qmacro.org/autodidactics/) blog

You can keep track of the posts on all these blogs, and also the other content I create, by checking [my home page on GitHub](https://github.com/qmacro), which lists the most recent items for each area.
