---
abstract: |
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
format:
  cmdline: see if double dash creates a bug # 'cls & remark 0*.md --view --output=cc2'
  show-titlepage: true
  show-published: true
  elegant-title: true
  thin-margins: true
  show-frame: false
  show-media: true
  media-in-back: false # true
  media-pagebreak: true
author:
- name: First Name
  affiliation: One University
  email: example@email.com
- name: Second Name
  affiliation: Another University
  email: lorem@email.com
institution: Foobar Institute
date: 'July 17, 2006'
title: Pandoc Test Suite
misc:
- item 1
- item 2
jel: [G21, D12, D62]
abstract: |
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
format:
  cmdline: see if double dash creates a bug # 'cls & remark 0*.md --view --output=cc2'
  show-titlepage: true
  show-published: true
  elegant-title: true
  thin-margins: true
  show-frame: false
  show-media: true
  media-in-back: false # true
  media-pagebreak: true
jel: [C01, C13, C23, C55, C81]
title: "CEO and Firm *Fixed* Effects in a Matched Panel"
subtitle: Identification and Estimation
#author: Sergio Correia
date: March 2016
theme: metropolis
fontsize: 11pt # 14pt
foobar: true
spam: false
q1: 'asd'
q2: "ASD"

foo:
  sapo: b
  rana: d

header-includes:
  - \metroset{progressbar=frametitle}
  - \usefonttheme[onlymath]{serif}
  # - \setsansfont[BoldFont={Fira Sans SemiBold}]{Fira Sans Book} # Bolder

build: cls & pandoc slides.md --to=beamer --latex-engine=xelatex --template=templates\default.beamer --output=..\out\slides.pdf && SumatraPDF ..\out\slides.pdf
...

This is a set of tests for pandoc. This file is copied from panflute.

As the authors said [such as @foo;@bar], and [@foo]

# Headers

## Level 2 with an [embedded link](/url)

### Level 3 with _emphasis_

#### Level 4

##### Level 5

# Level 1

## Level 2 with _emphasis_

### Level 3

with no blank line

## Level 2

with no blank line

---

# Paragraphs

Here’s a regular paragraph.

In Markdown 1.0.0 and earlier. Version 8. This line turns into a list item.
Because a hard-wrapped line in the middle of a paragraph looked like a list
item.

Here’s one with a bullet. \* criminey.

There should be a hard line break\
here.

---

# Block Quotes

E-mail style:

> This is a block quote. It is pretty short.

> Code in a block quote:
>
>     sub status {
>         print "working";
>     }
>
> A list:
>
> 1.  item one
> 2.  item two
>
> Nested block quotes:
>
> > nested
>
> > nested

This should not be a block quote: 2 &gt; 1.

And a following paragraph.

---

# Code Blocks

Code:

    ---- (should be four hyphens)

    sub status {
        print "working";
    }

    this code block is indented by one tab

And:

        this code block is indented by two tabs

    These should not be escaped:  \$ \\ \> \[ \{

---

# Lists

## Unordered

Asterisks tight:

- asterisk 1
- asterisk 2
- asterisk 3

Asterisks loose:

- asterisk 1

- asterisk 2

- asterisk 3

Pluses tight:

- Plus 1
- Plus 2
- Plus 3

Pluses loose:

- Plus 1

- Plus 2

- Plus 3

Minuses tight:

- Minus 1
- Minus 2
- Minus 3

Minuses loose:

- Minus 1

- Minus 2

- Minus 3

## Ordered

Tight:

1.  First
2.  Second
3.  Third

and:

1.  One
2.  Two
3.  Three

Loose using tabs:

1.  First

2.  Second

3.  Third

and using spaces:

1.  One

2.  Two

3.  Three

Multiple paragraphs:

1.  Item 1, graf one.

    Item 1. graf two. The quick brown fox jumped over the lazy dog’s back.

2.  Item 2.

3.  Item 3.

## Nested

- Tab
  - Tab
    - Tab

Here’s another:

1.  First
2.  Second:

    - Fee
    - Fie
    - Foe

3.  Third

Same thing but with paragraphs:

1.  First

2.  Second:

    - Fee
    - Fie
    - Foe

3.  Third

## Tabs and spaces

- this is a list item indented with tabs

- this is a list item indented with spaces

  - this is an example list item indented with tabs

  - this is an example list item indented with spaces

## Fancy list markers

(2) begins with 2
(3) and now 3

    with a continuation

    iv. sublist with roman numerals, starting with 4
    v.  more items
        (A) a subsublist
        (B) a subsublist

Nesting:

A. Upper Alpha
I. Upper Roman.
(6) Decimal start with 6
c) Lower alpha with paren

Autonumbering:

1.  Autonumber.
2.  More.
    1.  Nested.

Should not be a list item:

M.A. 2007

B. Williams

---

# Definition Lists

Tight using spaces:

apple
: red fruit

orange
: orange fruit

banana
: yellow fruit

Tight using tabs:

apple
: red fruit

orange
: orange fruit

banana
: yellow fruit

Loose:

apple

: red fruit

orange

: orange fruit

banana

: yellow fruit

Multiple blocks with italics:

_apple_

: red fruit

    contains seeds, crisp, pleasant to taste

_orange_

: orange fruit

        { orange code block }

    > orange block quote

Multiple definitions, tight:

apple
: red fruit
: computer

orange
: orange fruit
: bank

Multiple definitions, loose:

apple

: red fruit

: computer

orange

: orange fruit

: bank

Blank line after term, indented marker, alternate markers:

apple

: red fruit

: computer

orange

: orange fruit

    1.  sublist
    2.  sublist

# HTML Blocks

Simple block on one line:

<div>

foo

</div>

And nested without indentation:

<div>

<div>

<div>

foo

</div>

</div>

<div>

bar

</div>

</div>

Interpreted markdown in a table:

<table>
<tr>
<td>
This is *emphasized*
</td>
<td>
And this is **strong**
</td>
</tr>
</table>
<script type="text/javascript">document.write('This *should not* be interpreted as markdown');</script>
Here’s a simple block:

<div>

foo

</div>

This should be a code block, though:

    <div>
        foo
    </div>

As should this:

    <div>foo</div>

Now, nested:

<div>

<div>

<div>

foo

</div>

</div>

</div>

This should just be an HTML comment:

<!-- Comment -->

Multiline:

<!--
Blah
Blah
-->
<!--
    This is another comment.
-->

Code block:

    <!-- Comment -->

Just plain comment, with trailing spaces on the line:

<!-- foo -->

Code:

    <hr />

Hr’s:

<hr>
<hr />
<hr />
<hr>
<hr />
<hr />
<hr class="foo" id="bar" />
<hr class="foo" id="bar" />
<hr class="foo" id="bar">

---

# Inline Markup

This is _emphasized_, and so _is this_.

This is **strong**, and so **is this**.

An _[emphasized link](/url)_.

**_This is strong and em._**

So is **_this_** word.

**_This is strong and em._**

So is **_this_** word.

This is code: `>`, `$`, `\`, `\$`, `<html>`.

~~This is _strikeout_.~~

Superscripts: a^bc^d a^_hello_^ a^hello there^.

Subscripts: H~2~O, H~23~O, H~many of them~O.

These should not be superscripts or subscripts, because of the unescaped
spaces: a\^b c\^d, a\~b c\~d.

---

# Smart quotes, ellipses, dashes

“Hello,” said the spider. “‘Shelob’ is my name.”

‘A’, ‘B’, and ‘C’ are letters.

‘Oak,’ ‘elm,’ and ‘beech’ are names of trees. So is ‘pine.’

‘He said, “I want to go.”’ Were you alive in the 70’s?

Here is some quoted ‘`code`’ and a “[quoted
link](http://example.com/?foo=1&bar=2)”.

Some dashes: one—two — three—four — five.

Dashes between numbers: 5–7, 255–66, 1987–1999.

Ellipses…and…and….

---

# LaTeX

- \cite[22-23]{smith.1899}
- $2+2=4$
- $x \in y$
- $\alpha \wedge \omega$
- $223$
- $p$-Tree
- Here’s some display math:
  $$\frac{d}{dx}f(x)=\lim_{h\to 0}\frac{f(x+h)-f(x)}{h}$$
- Here’s one that has a line break in it: $\alpha + \omega \times x^2$.

These shouldn’t be math:

- To get the famous equation, write `$e = mc^2$`.
- \$22,000 is a _lot_ of money. So is \$34,000. (It worked if “lot”
  is emphasized.)
- Shoes (\$20) and socks (\$5).
- Escaped `$`: \$73 _this should be emphasized_ 23\$.

Here’s a LaTeX table:

\begin{tabular}{|l|l|}\hline
Animal & Number \\ \hline
Dog & 2 \\
Cat & 1 \\ \hline
\end{tabular}

---

# Special Characters

Here is some unicode:

- I hat: Î
- o umlaut: ö
- section: §
- set membership: ∈
- copyright: ©

AT&T has an ampersand in their name.

AT&T is another way to write it.

This & that.

4 &lt; 5.

6 &gt; 5.

Backslash: \\

Backtick: \`

Asterisk: \*

Underscore: \_

Left brace: {

Right brace: }

Left bracket: \[

Right bracket: \]

Left paren: (

Right paren: )

Greater-than: &gt;

Hash: \#

Period: .

Bang: !

Plus: +

Minus: -

---

# Links

## Explicit

Just a [URL](/url/).

[URL and title](/url/ "title").

[URL and title](/url/ "title preceded by two spaces").

[URL and title](/url/ "title preceded by a tab").

[URL and title](/url/ "title with "quotes" in it")

[URL and title](/url/ "title with single quotes")

[with_underscore](/url/with_underscore)

[Email link](mailto:nobody@nowhere.net)

[Empty]().

## Reference

Foo [bar](/url/).

Foo [bar](/url/).

Foo [bar](/url/).

With [embedded \[brackets\]](/url/).

[b](/url/) by itself should be a link.

Indented [once](/url).

Indented [twice](/url).

Indented [thrice](/url).

This should \[not\]\[\] be a link.

    [not]: /url

Foo [bar](/url/ "Title with "quotes" inside").

Foo [biz](/url/ "Title with "quote" inside").

## With ampersands

Here’s a [link with an ampersand in the URL](http://example.com/?foo=1&bar=2).

Here’s a link with an amersand in the link text:
[AT&T](http://att.com/ "AT&T").

Here’s an [inline link](/script?foo=1&bar=2).

Here’s an [inline link in pointy braces](/script?foo=1&bar=2).

## Autolinks

With an ampersand: <http://example.com/?foo=1&bar=2>

- In a list?
- <http://example.com/>
- It should.

An e-mail address: <nobody@nowhere.net>

> Blockquoted: <http://example.com/>

Auto-links should not occur here: `<http://example.com/>`

    or here: <http://example.com/>

---

# Images

From “Voyage dans la Lune” by Georges Melies (1902):

![lalune](lalune.jpg "Voyage dans la Lune")

Here is a movie ![movie](movie.jpg) icon.

---

# Footnotes

Here is a footnote reference,[^1] and another.[^2] This should _not_ be a
footnote reference, because it contains a space.\[\^my note\] Here is an
inline note.[^3]

> Notes can go in quotes.[^4]

1.  And in list items.[^5]

This paragraph should not be part of the note, as it is not indented.

[^1]:
    Here is the footnote. It can go anywhere after the footnote reference.
    It need not be placed at the end of the document.

[^2]: Here’s the long note. This one contains multiple blocks.

    Subsequent blocks are indented to show that they belong to the footnote
    (as with list items).

          { <code> }

    If you want, you can indent every line, but you can also be lazy and just
    indent the first line of each block.

[^3]:
    This is _easier_ to type. Inline notes may contain
    [links](http://google.com) and `]` verbatim characters, as well as
    \[bracketed text\].

[^4]: In quote.
[^5]: In list.

This is a set of tests for pandoc. Most of them are adapted from John Gruber’s
markdown test suite.

As the authors said [such as @foo;@bar], and [@foo]

# Headers

## Level 2 with an [embedded link](/url)

### Level 3 with _emphasis_

#### Level 4

##### Level 5

# Level 1

## Level 2 with _emphasis_

### Level 3

with no blank line

## Level 2

with no blank line

---

# Paragraphs

Here’s a regular paragraph.

In Markdown 1.0.0 and earlier. Version 8. This line turns into a list item.
Because a hard-wrapped line in the middle of a paragraph looked like a list
item.

Here’s one with a bullet. \* criminey.

There should be a hard line break\
here.

---

# Block Quotes

E-mail style:

> This is a block quote. It is pretty short.

> Code in a block quote:
>
>     sub status {
>         print "working";
>     }
>
> A list:
>
> 1.  item one
> 2.  item two
>
> Nested block quotes:
>
> > nested
>
> > nested

This should not be a block quote: 2 &gt; 1.

And a following paragraph.

---

# Code Blocks

Code:

    ---- (should be four hyphens)

    sub status {
        print "working";
    }

    this code block is indented by one tab

And:

        this code block is indented by two tabs

    These should not be escaped:  \$ \\ \> \[ \{

---

# Lists

## Unordered

Asterisks tight:

- asterisk 1
- asterisk 2
- asterisk 3

Asterisks loose:

- asterisk 1

- asterisk 2

- asterisk 3

Pluses tight:

- Plus 1
- Plus 2
- Plus 3

Pluses loose:

- Plus 1

- Plus 2

- Plus 3

Minuses tight:

- Minus 1
- Minus 2
- Minus 3

Minuses loose:

- Minus 1

- Minus 2

- Minus 3

## Ordered

Tight:

1.  First
2.  Second
3.  Third

and:

1.  One
2.  Two
3.  Three

Loose using tabs:

1.  First

2.  Second

3.  Third

and using spaces:

1.  One

2.  Two

3.  Three

Multiple paragraphs:

1.  Item 1, graf one.

    Item 1. graf two. The quick brown fox jumped over the lazy dog’s back.

2.  Item 2.

3.  Item 3.

## Nested

- Tab
  - Tab
    - Tab

Here’s another:

1.  First
2.  Second:

    - Fee
    - Fie
    - Foe

3.  Third

Same thing but with paragraphs:

1.  First

2.  Second:

    - Fee
    - Fie
    - Foe

3.  Third

## Tabs and spaces

- this is a list item indented with tabs

- this is a list item indented with spaces

  - this is an example list item indented with tabs

  - this is an example list item indented with spaces

## Fancy list markers

(2) begins with 2
(3) and now 3

    with a continuation

    iv. sublist with roman numerals, starting with 4
    v.  more items
        (A) a subsublist
        (B) a subsublist

Nesting:

A. Upper Alpha
I. Upper Roman.
(6) Decimal start with 6
c) Lower alpha with paren

Autonumbering:

1.  Autonumber.
2.  More.
    1.  Nested.

Should not be a list item:

M.A. 2007

B. Williams

---

# Definition Lists

Tight using spaces:

apple
: red fruit

orange
: orange fruit

banana
: yellow fruit

Tight using tabs:

apple
: red fruit

orange
: orange fruit

banana
: yellow fruit

Loose:

apple

: red fruit

orange

: orange fruit

banana

: yellow fruit

Multiple blocks with italics:

_apple_

: red fruit

    contains seeds, crisp, pleasant to taste

_orange_

: orange fruit

        { orange code block }

    > orange block quote

Multiple definitions, tight:

apple
: red fruit
: computer

orange
: orange fruit
: bank

Multiple definitions, loose:

apple

: red fruit

: computer

orange

: orange fruit

: bank

Blank line after term, indented marker, alternate markers:

apple

: red fruit

: computer

orange

: orange fruit

    1.  sublist
    2.  sublist

# HTML Blocks

Simple block on one line:

<div>

foo

</div>

And nested without indentation:

<div>

<div>

<div>

foo

</div>

</div>

<div>

bar

</div>

</div>

Interpreted markdown in a table:

<table>
<tr>
<td>
This is *emphasized*
</td>
<td>
And this is **strong**
</td>
</tr>
</table>
<script type="text/javascript">document.write('This *should not* be interpreted as markdown');</script>
Here’s a simple block:

<div>

foo

</div>

This should be a code block, though:

    <div>
        foo
    </div>

As should this:

    <div>foo</div>

Now, nested:

<div>

<div>

<div>

foo

</div>

</div>

</div>

This should just be an HTML comment:

<!-- Comment -->

Multiline:

<!--
Blah
Blah
-->
<!--
    This is another comment.
-->

Code block:

    <!-- Comment -->

Just plain comment, with trailing spaces on the line:

<!-- foo -->

Code:

    <hr />

Hr’s:

<hr>
<hr />
<hr />
<hr>
<hr />
<hr />
<hr class="foo" id="bar" />
<hr class="foo" id="bar" />
<hr class="foo" id="bar">

---

# Inline Markup

This is _emphasized_, and so _is this_.

This is **strong**, and so **is this**.

An _[emphasized link](/url)_.

**_This is strong and em._**

So is **_this_** word.

**_This is strong and em._**

So is **_this_** word.

This is code: `>`, `$`, `\`, `\$`, `<html>`.

~~This is _strikeout_.~~

Superscripts: a^bc^d a^_hello_^ a^hello there^.

Subscripts: H~2~O, H~23~O, H~many of them~O.

These should not be superscripts or subscripts, because of the unescaped
spaces: a\^b c\^d, a\~b c\~d.

---

# Smart quotes, ellipses, dashes

“Hello,” said the spider. “‘Shelob’ is my name.”

‘A’, ‘B’, and ‘C’ are letters.

‘Oak,’ ‘elm,’ and ‘beech’ are names of trees. So is ‘pine.’

‘He said, “I want to go.”’ Were you alive in the 70’s?

Here is some quoted ‘`code`’ and a “[quoted
link](http://example.com/?foo=1&bar=2)”.

Some dashes: one—two — three—four — five.

Dashes between numbers: 5–7, 255–66, 1987–1999.

Ellipses…and…and….

---

# LaTeX

- \cite[22-23]{smith.1899}
- $2+2=4$
- $x \in y$
- $\alpha \wedge \omega$
- $223$
- $p$-Tree
- Here’s some display math:
  $$\frac{d}{dx}f(x)=\lim_{h\to 0}\frac{f(x+h)-f(x)}{h}$$
- Here’s one that has a line break in it: $\alpha + \omega \times x^2$.

These shouldn’t be math:

- To get the famous equation, write `$e = mc^2$`.
- \$22,000 is a _lot_ of money. So is \$34,000. (It worked if “lot”
  is emphasized.)
- Shoes (\$20) and socks (\$5).
- Escaped `$`: \$73 _this should be emphasized_ 23\$.

Here’s a LaTeX table:

\begin{tabular}{|l|l|}\hline
Animal & Number \\ \hline
Dog & 2 \\
Cat & 1 \\ \hline
\end{tabular}

---

# Special Characters

Here is some unicode:

- I hat: Î
- o umlaut: ö
- section: §
- set membership: ∈
- copyright: ©

AT&T has an ampersand in their name.

AT&T is another way to write it.

This & that.

4 &lt; 5.

6 &gt; 5.

Backslash: \\

Backtick: \`

Asterisk: \*

Underscore: \_

Left brace: {

Right brace: }

Left bracket: \[

Right bracket: \]

Left paren: (

Right paren: )

Greater-than: &gt;

Hash: \#

Period: .

Bang: !

Plus: +

Minus: -

---

# Links

## Explicit

Just a [URL](/url/).

[URL and title](/url/ "title").

[URL and title](/url/ "title preceded by two spaces").

[URL and title](/url/ "title preceded by a tab").

[URL and title](/url/ "title with "quotes" in it")

[URL and title](/url/ "title with single quotes")

[with_underscore](/url/with_underscore)

[Email link](mailto:nobody@nowhere.net)

[Empty]().

## Reference

Foo [bar](/url/).

Foo [bar](/url/).

Foo [bar](/url/).

With [embedded \[brackets\]](/url/).

[b](/url/) by itself should be a link.

Indented [once](/url).

Indented [twice](/url).

Indented [thrice](/url).

This should \[not\]\[\] be a link.

    [not]: /url

Foo [bar](/url/ "Title with "quotes" inside").

Foo [biz](/url/ "Title with "quote" inside").

## With ampersands

Here’s a [link with an ampersand in the URL](http://example.com/?foo=1&bar=2).

Here’s a link with an amersand in the link text:
[AT&T](http://att.com/ "AT&T").

Here’s an [inline link](/script?foo=1&bar=2).

Here’s an [inline link in pointy braces](/script?foo=1&bar=2).

## Autolinks

With an ampersand: <http://example.com/?foo=1&bar=2>

- In a list?
- <http://example.com/>
- It should.

An e-mail address: <nobody@nowhere.net>

> Blockquoted: <http://example.com/>

Auto-links should not occur here: `<http://example.com/>`

    or here: <http://example.com/>

---

# Images

From “Voyage dans la Lune” by Georges Melies (1902):

![lalune](lalune.jpg "Voyage dans la Lune")

Here is a movie ![movie](movie.jpg) icon.

---

# Footnotes

Here is a footnote reference,[^6] and another.[^7] This should _not_ be a
footnote reference, because it contains a space.\[\^my note\] Here is an
inline note.[^8]

> Notes can go in quotes.[^9]

1.  And in list items.[^10]

This paragraph should not be part of the note, as it is not indented.

[^6]:
    Here is the footnote. It can go anywhere after the footnote reference.
    It need not be placed at the end of the document.

[^7]: Here’s the long note. This one contains multiple blocks.

    Subsequent blocks are indented to show that they belong to the footnote
    (as with list items).

          { <code> }

    If you want, you can indent every line, but you can also be lazy and just
    indent the first line of each block.

[^8]:
    This is _easier_ to type. Inline notes may contain
    [links](http://google.com) and `]` verbatim characters, as well as
    \[bracketed text\].

[^9]: In quote.
[^10]: In list.

# A table without header

<!-- prettier-ignore-start-->

-------     ------ ----------   -------
     12     12        12             12
    123     123       123           123
      1     1          1              1
-------     ------ ----------   -------


<!-- prettier-ignore-end-->

# A table with caption

: Add-ons

| Category  | Details | Amount |
| --------- | ------- | -----: |
| Category1 | Hourly  |    $20 |
| Category2 | Hourly  |    $25 |
| Category3 | Fixed   |    $30 |

# Another table with caption

<!-- prettier-ignore-start-->

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.


This file contains fenced code blocks that can be used
to test the panflute code that deals with YAML code blocks,
as discussed [here](http://scorreia.com/software/panflute/guide.html#yaml-code-blocks)

# Standard examples

## Just raw data

~~~ spam
---
raw text
~~~

~~~ spam
...
raw text
~~~

## Just YAML

~~~ spam
foo: bar
bacon: True
~~~

## Both

~~~ spam
foo: bar
bacon: True
---
raw text
~~~

~~~ spam
foo: bar
bacon: True
...
raw text
~~~

## Longer delimiters

~~~ spam
foo: bar
bacon: True
.......
raw text
~~~

# Strict-YAML examples

## Just raw data

~~~ eggs
raw text
~~~

~~~ eggs
---
...
raw text
~~~

~~~ eggs
raw text
---
---
~~~

~~~ eggs
---
...
raw text
---
...
~~~

## Just YAML

~~~ eggs
---
foo: bar
bacon: True
~~~

~~~ eggs
---
foo: bar
bacon: True
...
~~~

## Both

~~~ eggs
---
foo: bar
bacon: True
---
raw text
~~~

~~~ eggs
---
foo: bar
bacon: True
...
raw text
~~~

## Longer delimiters

~~~ eggs
---
foo: bar
bacon: True
-----
raw text
~~~

## Both; metadata interlinked

~~~ eggs
raw1
---
foo: bar
...
raw2
---
spam: eggs
---
this
...
is
...
all raw
~~~


Test api changes for python 2.10

To run (on a windows install), go to the `examples\panflute` folder and type:

```
cls & pandoc --filter=pandoc-2.10.py ../input/pandoc-2.10.md
```

- See: https://github.com/jgm/pandoc/releases/tag/2.10
- See: https://pandoc.org/lua-filters.html (diff it)

# Support underline tag

[this text will be underlined]{.ul}

*This text will not be underlined* but **this text will be**.


# Tables

Will add examples from [https://pandoc.org/MANUAL.html#tables]

## Simple tables

Example:

| Variable | Mean |
|----------|------|
| Price    | 10   |
| Weight   | 12   |



## Tables with alignment

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.


## Table 2

-------     ------ ----------   -------
     12     12        12             12
    123     123       123           123
      1     1          1              1
-------     ------ ----------   -------



## Multiline table

-------------------------------------------------------------
 Centered   Default           Right Left
  Header    Aligned         Aligned Aligned
----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
-------------------------------------------------------------

Table: Here's the caption. It, too, may span
multiple lines.


## Multiline without a header

----------- ------- --------------- -------------------------
   First    row                12.0 Example of a row that
                                    spans multiple lines.

  Second    row                 5.0 Here's another one. Note
                                    the blank line between
                                    rows.
----------- ------- --------------- -------------------------

: Here's a multiline table without a header.


## Grid table

: Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+


## Aligned grid table

+---------------+---------------+--------------------+
| Right         | Left          | Centered           |
+==============:+:==============+:==================:+
| Bananas       | $1.34         | built-in wrapper   |
+---------------+---------------+--------------------+

## Aligned headerless table

+--------------:+:--------------+:------------------:+
| Right         | Left          | Centered           |
+---------------+---------------+--------------------+

## Pipe table

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

  : Demonstration of pipe table syntax.

<!-- prettier-ignore-end-->
