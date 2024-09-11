# jekyll-updated-plugin

A Jekyll plugin to list all updated entries in site collections, by [Matt Gemmell](https://mattgemmell.scot/).

I use [Jekyll](https://jekyllrb.com) to build my site, and I make use of its support for discrete [collections](https://jekyllrb.com/docs/collections/) of content: my blog posts, my [books](https://mattgemmell.scot/books), bonus scenes, [short stories](https://mattgemmell.scot/stories), and so on.

Recently, I've been doing video readings of my stories, beginning way back at the start of the series (which is almost 200 tales long at time of writing). I post the videos [on YouTube](https://www.youtube.com/playlist?list=PLyMTWEeyiYqECkQu5TsHZQstFpSkkePyh), and I also embed each video on the appropriate story's page on this site.

This raises the issue of surfacing those old stories — making them prominent again — when a video has been added. I don't want to change the publication date of the original stories, but I'd like them to be more visible when they've been updated. To help me do that, I created a Jekyll plugin. It works as follows.

1. When I update an old post (or other content) in some way, like adding a video to a story, I add a field to the content's YAML front matter noting when the update was made: `updated: 2024-09-11`.

2. The plugin, which is of the [generator](https://jekyllrb.com/docs/plugins/generators/) type, then creates a new entry in the site's `data`, entitled `updated`. It's an array of information about each document which has the `updated` field in its front matter. Each entry contains:

- The document's own front matter variables, including those inherited from its collection defaults.
- Its `id`, `url`, and `collection` (specifically, the label/name of the collection).
- Its original publication date, as `original_date`.
- A `date` which is the value of the `updated` front matter variable.

The information is available from any page or template, anywhere in the site, via Liquid: `{{ site.data.updated }}`. It's particularly useful to concatenate with the contents of the site's collections, and then sort by date, before showing as a list of links. This will have the effect of showing updates to content in the chronology, linked to the original content. The information in an update entry can also easily be used to look up the corresponding original content in the site's collections.

This solution seemed like the lowest-overhead approach, requiring just a single semantic piece of front matter data, and is open to many possible uses. In my own case, when I add a video to a given story, the story appears again in [my blog's chronology](https://mattgemmell.scot/blog), and is visually flagged as being updated.

To install the plugin, just put the `updated.rb` file into the `_plugins` folder in the root of your Jekyll site, creating that folder if necessary, or wherever you've configured your site to look for plugins.
