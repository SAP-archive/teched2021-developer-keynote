# Parsing BTP CLI JSON output to retrieve resource GUIDs

_In this second part of a 2-part blog post series on getting BTP resource GUIDs with the BTP CLI, we look at how the CLI supports JSON output, why it's a good choice, and how to parse that._

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

## Where I write my posts

I write posts here on the SAP Community, but I have blogs elsewhere that I write posts on too - my [main blog](https://qmacro.org), a [language ramblings blog](https://langram.org/), I have my journal entries in my GitHub-issue based [Thinking Aloud](https://github.com/qmacro/thinking-aloud) blog, and I have my [Autodidactics](https://qmacro.org/autodidactics/) blog where I write posts about stuff I've learned.

> You can keep track of the posts on all these blogs, and also the other content I create, by checking [my home page on GitHub](https://github.com/qmacro), which lists the most recent items for each area.

## Parsing brittle plain text output vs complex JSON output

I wrote about this very challenge of parsing text output that was brittle, in a blog post over on my Autodidactics blog: [Embracing jq and JSON](https://qmacro.org/autodidactics/2021/10/29/embracing-jq-and-json/). The subject at hand was even the same - the ouptut of `btp get account/global-account --show-hierarchy`, and pointed out the difficulty of correctly extracting the resource display name 'this and that'.
