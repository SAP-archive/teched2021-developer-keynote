# Parsing BTP CLI JSON output to retrieve resource GUIDs

_In this second part of a 2-part blog post series on getting BTP resource GUIDs with the BTP CLI, we look at how the CLI supports JSON output and how to parse that._

## The Unix philosophy and alternative output formats

The [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) is all about small programs, joined loosely together. About composability\*, not monolithic constructs.

\* It is not lost on me that composability is a key feature of the functional programming paradigm, which has a similar beauty to me.

This approach to executing programs, using the power of input / output redirection & pipelines and employing a handful of small, focused & powerful tools has been with us for almost half a century now and is at the heart of the dominant operating system powering the cloud.

More recently, we've been seeing a need to deal with resources that are described by, or embodied within data that has more structure than mostly record-oriented plain text. In parallel, we're seeing declarative approaches to devops and system resource management (such as Kubernetes cluster definitions, infrastructure-as-code, and so on), with those declarative constructs expressed in a handful of formats, JSON and YAML being the most common.

These formats lend themselves well to describing requirements, but also to representing structure. With the myriad resources on SAP Business Technology Platform, there are relationships that need to be expressed, conveying inherent structure that is fundamental to the understanding and operation of those resources.

And so, like many of today's command line tools, the btp CLI has an option to express the output in a format that can reliably, predictably and cleanly convey that structure.

