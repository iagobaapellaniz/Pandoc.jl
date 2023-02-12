__precompile__(true)

"""
    Pandoc

Pandoc wrapper to read JSON AST from `pandoc`

See https://hackage.haskell.org/package/pandoc-types-1.23/docs/Text-Pandoc-Definition.html
"""
module Pandoc

using Markdown

using EnumX
using FilePathsBase
using InlineTest
using JSON3
using StructTypes

using pandoc_jll

const PANDOC_JL_EXECUTABLE = get(ENV, "PANDOC_JL_EXECUTABLE", pandoc())

@enum Alignment AlignLeft AlignRight AlignCenter AlignDefault
Alignment() = AlignDefault

"""
Style of list numbers.
"""
@enum ListNumberStyle DefaultStyle Example Decimal LowerRoman UpperRoman LowerAlpha UpperAlpha
ListNumberStyle() = DefaultStyle

"""
Delimiter of list numbers.
"""
@enum ListNumberDelim DefaultDelim Period OneParen TwoParens
ListNumberDelim() = DefaultDelim

"""
Type of quotation marks to use in Quoted inline.
"""
@enum QuoteType SingleQuote DoubleQuote

"""
Type of math element (display or inline).
"""
@enum MathType DisplayMath InlineMath

@enum CitationMode AuthorInText SuppressAuthor NormalCitation

abstract type Element end

abstract type Inline <: Element end
abstract type Block <: Element end

const Format = String
const Text = String
const TableCell = Vector{Block}

"""
Attr: identifier, classes, key-value pairs
"""
Base.@kwdef struct Attr
  identifier::String = ""
  classes::Vector{String} = []
  attributes::Vector{Pair{String,String}} = []
end

struct Citation
  id::String
  prefix::Vector{Inline}
  suffix::Vector{Inline}
  mode::CitationMode
  note_number::Int
  hash::Int
end

"""
List attributes.

The first element of the triple is the start number of the list.
"""
Base.@kwdef struct ListAttributes
  number::Int = 1
  style::ListNumberStyle = ListNumberStyle()
  delim::ListNumberDelim = ListNumberDelim()
end

"""
Plain text, not a paragraph
"""
struct Plain <: Block
  content::Vector{Inline}
end

"""
Paragraph
"""
struct Para <: Block
  content::Vector{Inline}
end

"""
Multiple non-breaking lines
"""
struct LineBlock <: Block
  content::Vector{Vector{Inline}}
end

"""
Code block (literal) with attributes
"""
struct CodeBlock <: Block
  attr::Attr
  content::Text
end
CodeBlock(content) = CodeBlock(Attr(), content)

"""
Raw block
"""
struct RawBlock <: Block
  format::Format
  content::Text
end

"""
Block quote (list of blocks)
"""
struct BlockQuote <: Block
  content::Vector{Block}
end

"""
Ordered list (attributes and a list of items, each a list of blocks)
"""
struct OrderedList <: Block
  attr::ListAttributes
  content::Vector{Vector{Block}}
end

"""
Bullet list (list of items, each a list of blocks)
"""
struct BulletList <: Block
  content::Vector{Vector{Block}}
end

"""
Definition list. Each list item is a pair consisting of a term (a list of inlines) and one or more definitions (each a list of blocks)
"""
struct DefinitionList <: Block
  content::Vector{Pair{Vector{Inline},Vector{Vector{Block}}}}
end

"""
Header - level (integer) and text (inlines)
"""
struct Header <: Block
  level::Int
  attr::Attr
  content::Vector{Element}
end
Header(level) = Header(level, Attr(), [])
Header(level, content) = Header(level, Attr(), content)

"""
Horizontal rule
"""
struct HorizontalRule <: Block end

"""
The width of a table column, as a percentage of the text width.
"""
Base.@kwdef struct ColWidth
  width::Union{Float64,Symbol} = :ColWidthDefault
end

"""
The specification for a single table column.
"""
Base.@kwdef struct ColSpec
  alignment::Alignment = Alignment()
  colwidth::ColWidth = ColWidth()
end

"""
The number of rows occupied by a cell; the height of a cell.
"""
const RowSpan = Int

"""
The number of columns occupied by a cell; the width of a cell.
"""
const ColSpan = Int

"""
A table cell.
"""
Base.@kwdef struct Cell
  attr::Attr = Attr()
  alignment::Alignment = AlignDefault
  rowspan::RowSpan = 1
  colspan::ColSpan = 1
  content::Vector{Block} = []
end

struct Row
  attr::Attr
  cells::Vector{Cell}
end

"""
The head of a table.
"""
Base.@kwdef struct TableHead
  attr::Attr = Attr()
  rows::Vector{Row} = []
end

"""
The number of columns taken up by the row head of each row of a 'TableBody'. The row body takes up the remaining columns.
"""
const RowHeadColumns = Int

"""
A body of a table, with an intermediate head, intermediate body,
and the specified number of row header columns in the intermediate
body.
"""
Base.@kwdef struct TableBody
  attr::Attr = Attr()
  rowheadcolumns::RowHeadColumns = 0
  head::Vector{Row} = []
  content::Vector{Row} = []
end

"""
The foot of a table.
"""
Base.@kwdef struct TableFoot
  attr::Attr = Attr()
  content::Vector{Row} = []
end

"""
A short caption, for use in, for instance, lists of figures.
"""
struct ShortCaption
  content::Vector{Inline}
end

"""
The caption of a table or figure, with optional short caption.
"""
struct Caption
  caption::Union{ShortCaption,Nothing}
  content::Vector{Block}
end

"""
Table, with attributes, caption, optional short caption,
column alignments and widths (required), table head, table
bodies, and table foot
"""
Base.@kwdef struct Table <: Block
  attr::Attr = Attr()
  caption::Caption = Caption()
  colspec::Vector{ColSpec} = []
  head::TableHead = TableHead()
  bodies::Vector{TableBody} = []
  foot::TableFoot = TableFoot()
end

struct Figure <: Block
  attr::Attr
  caption::Caption
  content::Vector{Block}
end

"""
Generic block container with attributes
"""
struct Div <: Block
  attr::Attr
  content::Vector{Block}
end
Div(content) = Div(Attr(), content)

struct Null <: Block end

"""
Link target (URL, title).
"""
struct Target
  url::Text
  title::Text
end

"""
Text (string)
"""
struct Str <: Inline
  content::Text
end

"""
Emphasized text (list of inlines)
"""
struct Emph <: Inline
  content::Vector{Inline}
end

"""
Underlined text (list of inlines)
"""
struct Underline <: Inline
  content::Vector{Inline}
end

"""
Strongly emphasized text (list of inlines)
"""
struct Strong <: Inline
  content::Vector{Inline}
end

"""
Strikeout text (list of inlines)
"""
struct Strikeout <: Inline
  content::Vector{Inline}
end

"""
Superscripted text (list of inlines)
"""
struct Superscript <: Inline
  content::Vector{Inline}
end

"""
Subscripted text (list of inlines)
"""
struct Subscript <: Inline
  content::Vector{Inline}
end

"""
Small caps text (list of inlines)
"""
struct SmallCaps <: Inline
  content::Vector{Inline}
end

"""
Quoted text (list of inlines)
"""
struct Quoted <: Inline
  quote_type::QuoteType
  content::Vector{Inline}
end

"""
Citation (list of inlines)
"""
struct Cite <: Inline
  citations::Vector{Citation}
  content::Vector{Inline}
end

"""
Inline code (literal)
"""
struct Code <: Inline
  attr::Attr
  content::Text
end
Code(content) = Code(Attr(), content)

"""
Inter-word space
"""
struct Space <: Inline end

"""
Soft line break
"""
struct SoftBreak <: Inline end

"""
Hard line break
"""
struct LineBreak <: Inline end

"""
TeX math (literal)
"""
struct Math <: Inline
  math_type::MathType
  content::Text
end

"""
Raw inline
"""
struct RawInline <: Inline
  format::Format
  content::Text
end

"""
Hyperlink: alt text (list of inlines), target
"""
struct Link <: Inline
  attr::Attr
  content::Vector{Inline}
  target::Target
end
Link(content, target) = Link(Attr(), content, target)

"""
Image: alt text (list of inlines), target
"""
struct Image <: Inline
  attr::Attr
  content::Vector{Inline}
  target::Target
end
Image(content, target) = Image(Attr(), content, target)

"""
Footnote or endnote
"""
struct Note <: Inline
  content::Vector{Block}
end

"""
Generic inline container with attributes
"""
struct Span <: Inline
  attr::Attr
  content::Vector{Inline}
end
Span(content) = Span(Attr(), content)

struct Unknown
  e::Any
  t::Any
end

pandoc_api_version() = v"1.23"
pandoc_api_version(v) = pandoc_api_version(v, Val(length(v)))
pandoc_api_version(v, length::Val{0}) = error("Version array has to be length > 0 but got `$v` instead")
pandoc_api_version(v, length::Val{1}) = VersionNumber(v[1])
pandoc_api_version(v, length::Val{2}) = VersionNumber(v[1], v[2])
pandoc_api_version(v, length::Val{3}) = VersionNumber(v[1], v[2], v[3])
pandoc_api_version(v, length) = VersionNumber(v[1], v[2], v[3], tuple(v[4:end]...))

# const MetaValue = Union{Dict{String, MetaValue}, Vector{MetaValue}, Bool, String, Vector{Inline}, Vector{Block}}
const MetaValue = Any

Base.@kwdef mutable struct Document
  data::Dict{Symbol,Any} = Dict()
  pandoc_api_version::VersionNumber = v"1.23"
  meta::Dict{String,MetaValue} = Dict()
  blocks::Vector{Block} = []
end
StructTypes.StructType(::Type{Document}) = StructTypes.Mutable()

Document(data::String) = JSON3.read(data, Document)

@testset "document json" begin
  doc = Document("""
 {
    "pandoc-api-version": "1.23",
    "meta": {},
    "blocks": [],
    "data": {}
 }
 """)
  @test doc.pandoc_api_version == v"1.23"
end

function Document(data::AbstractPath)
  if extension(data) == "json"
    JSON3.read(read(data), Document)
  else
    throw(ErrorException("Not implemented yet"))
  end
end

end # module
