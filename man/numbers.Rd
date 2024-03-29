% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{numbers}
\alias{numbers}
\title{A table with localized numerical attributes and descriptors}
\format{
An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 574 rows and 26 columns.
}
\usage{
numbers
}
\description{
The \code{numbers} table contains localized data for number-related entities
across 574 locales. This table has
574 rows (one per locale) and the following 26 columns:
\itemize{
\item \code{locale} (\code{character})
\item \code{default_numbering_system} (\code{character})
\item \code{other_numbering_systems} (\verb{named list [variable length]})
\item \code{minimum_grouping_digits} (\code{integer})
\item \code{decimal} (\code{character})
\item \code{group} (\code{character})
\item \code{list} (\code{character})
\item \code{percent_sign} (\code{character})
\item \verb{plus_sign"} (\code{character})
\item \code{minus_sign} (\code{character})
\item \code{approx_sign} (\code{character})
\item \code{exp_sign} (\code{character})
\item \code{sup_exp} (\code{character})
\item \code{per_mille} (\code{character})
\item \code{infinity} (\code{character})
\item \code{nan} (\code{character})
\item \code{time_sep} (\code{character})
\item \code{approx_pattern} (\code{character})
\item \code{at_least_pattern} (\code{character})
\item \code{at_most_pattern} (\code{character})
\item \code{range_pattern} (\code{character})
\item \code{decimal_format} (\code{character})
\item \code{sci_format} (\code{character})
\item \code{percent_format} (\code{character})
\item \code{currency_format} (\code{character})
\item \code{accounting_format} (\code{character})
}

The first column, \code{locale}, is the locale name (e.g., \code{"en"}, \code{"de-AT"},
etc.). The remaining 25 columns will be explained in separate sections.
}
\section{Default Numbering System}{


The \code{default_numbering_system} (\emph{CLDR}: \code{'defaultNumberingSystem'}) column
provides an element that indicates which numbering system should be used for
presentation of numeric quantities in the given locale.
}

\section{Other Numbering Systems}{


The \code{other_numbering_systems} (\emph{CLDR}: \code{'otherNumberingSystems'}) column
provides an element that defines general categories of numbering systems that
are sometimes used in the given locale for formatting numeric quantities.
These additional numbering systems are often used in very specific contexts,
such as in calendars or for financial purposes. There are currently three
defined categories, as follows:

\strong{native}

Defines the numbering system used for the native digits, usually defined as a
part of the script used to write the language. The native numbering system
can only be a numeric positional decimal-digit numbering system, using digits
with General_Category=Decimal_Number. In locales where the native numbering
system is the default, it is assumed that the numbering system \code{"latn"} (
Western Digits \code{0}-\code{9}) is always acceptable, and can be selected using the
\code{"-nu"} keyword as part of a Unicode locale identifier.

\strong{traditional}

Defines the traditional numerals for a locale. This numbering system may be
numeric or algorithmic. If the traditional numbering system is not defined,
applications should use the native numbering system as a fallback.

\strong{finance}

Defines the numbering system used for financial quantities. This numbering
system may be numeric or algorithmic. This is often used for ideographic
languages such as Chinese, where it would be easy to alter an amount
represented in the default numbering system simply by adding additional
strokes. If the financial numbering system is not specified, applications
should use the default numbering system as a fallback.

The categories defined for other numbering systems can be used in a Unicode
locale identifier to select the proper numbering system without having to
know the specific numbering system by name. To select the Hindi language
using the native digits for numeric formatting, use locale ID
\code{"hi-IN-u-nu-native"}. To select the Chinese language using the appropriate
financial numerals, use locale ID: \code{"zh-u-nu-finance"}. With the Tamil
language using the traditional Tamil numerals, use locale ID
\code{"ta-u-nu-traditio"}. As a last example, to select the Arabic language using
western digits \code{0}-\code{9}, use locale ID \code{"ar-u-nu-latn"}.
}

\section{Minimum Grouping Digits}{


The \code{minimum_grouping_digits} (\emph{CLDR}: \code{'minimumGroupingDigits'}) value can
be used to suppress groupings below a certain value. This is used for
languages such as Polish, where one would only write the grouping separator
for values above \code{9999}. The \code{minimum_grouping_digits} value contains the
default for the locale.
}

\section{Number Symbols}{


Number symbols define the localized symbols that are commonly used when
formatting numbers in a given locale. These symbols can be referenced using a
number formatting pattern.

The \code{decimal} (\emph{CLDR}: \code{'decimal'}) symbol separates the integer and
fractional part of the number. The \code{group} (\emph{CLDR}: \code{'group'}) symbol
separates clusters of integer digits to make large numbers more legible;
commonly used for thousands (grouping size 3, e.g. \code{"100,000,000"}) or in
some locales, ten-thousands (grouping size 4, e.g. \code{"1,0000,0000"}). There
may be two different grouping sizes: The primary grouping size used for the
least significant integer group, and the secondary grouping size used for
more significant groups; these are not the same in all locales (e.g.
\code{"12,34,56,789"}). If a pattern contains multiple grouping separators, the
interval between the last one and the end of the integer defines the primary
grouping size, and the interval between the last two defines the secondary
grouping size. All others are ignored, so \code{"#,##,###,####"} ==
\code{"###,###,####"} == \code{"##,#,###,####"}.

The \code{list} (\emph{CLDR}: \code{'list'}) symbol is used to separate numbers in a list
intended to represent structured data such as an array. It must be different
from the decimal value. This list separator is for non-linguistic usage as
opposed to the list patterns for linguistic lists (e.g. \code{"Bob, Carol, and Ted"}).

The \code{plus_sign} (\emph{CLDR}: \code{'plusSign'}) is the preferred symbol for expressing
a positive value and the \code{minus_sign} (\emph{CLDR}: \code{'minusSign'}) is for negative
values. It can be used to produce modified patterns, so that \code{"3.12"} is
formatted as \code{"+3.12"}, for example. The standard number patterns (except for
accounting notation) will contain the \code{minus_sign}, explicitly or implicitly.
In the explicit pattern, the value of the \code{plus_sign} can be substituted for
the value of the \code{minus_sign} to produce a pattern that has an explicit plus
sign.

The \code{approx_sign} (\emph{CLDR}: \code{'approximatelySign'}) element contains a symbol
used to denote an approximate value. The symbol is substituted in place of
the \code{minus_sign} using the same semantics as \code{plus_sign} substitution.

The \code{exp_sign} (\emph{CLDR}: \code{'exponential'}) provides a symbol used for
separating the mantissa and exponent values. The exponential notation in
\code{sup_exp} (\emph{CLDR}: \code{'superscriptingExponent'}) could alternatively be used to
show a format like \code{"1.23 × 104"}. The superscripting can use markup, such as
\verb{<sup>4</sup>} in HTML, or for the special case of Latin digits, use
superscripted numeral characters.

The \code{percent_sign} (\emph{CLDR}: \code{'percentSign'}) is a symbol used to indicate a
percentage (1/100th) amount. If present, the value might require
multiplication by \code{100} before formatting. The \code{per_mille} (\emph{CLDR}:
\code{'perMille'}) symbol used to indicate a per mille (1/1000th) amount. If
present, the value might need to be multiplied by \code{1000} before formatting.

The infinity sign is provided in the \code{infinity} (\emph{CLDR}: \code{'infinity'})
element. The \code{nan} element (\emph{CLDR}: \code{'nan'}) has the NaN (not a number) sign.
These elements both correspond to the IEEE bit patterns for infinity and NaN.

The \code{time_sep} (\emph{CLDR}: \code{'timeSeparator'}) pattern allows the same time
format to be used for multiple number systems when the time separator depends
on the number system. For example, the time format for Arabic should be a
colon when using the Latin numbering system, but when the Arabic numbering
system is used, the traditional time separator in older print styles was
often Arabic comma.
}

\section{Miscellaneous Patterns}{


There are several miscellaneous patterns for special purposes. The
\code{approx_pattern} (\emph{CLDR}: \code{'approximately'}) indicates an approximate number,
such as: \code{"~99"}. With the pattern called \code{at_most_pattern} (\emph{CLDR}:
\code{'atMost'}) we can describe an upper limit. This indicates that, for example,
there are \code{99} items or fewer. The \code{at_least_pattern} (\emph{CLDR}: \code{'atLeast'})
describes a lower limit. This might be \code{"99+"} to indicate that there are
\code{99} items or more. With the \code{range_pattern} (\emph{CLDR}: \code{'range'}), a range of
numbers, such as \code{"99–103"}, can be used to indicate that there are from \code{99}
to \code{103} items.
}

\section{Number Formats}{


Number formats are used to define the rules for formatting numeric
quantities. Different formats are provided for different contexts. The
\code{decimal_format} (\emph{CLDR}: \code{'decimalFormats'}) is the prescribed
locale-specific way to write a base 10 number. Variations of the
\code{decimal_format} pattern are provided that allow compact number formatting.
The \code{percent_format} (\emph{CLDR}: \code{'percentFormats'}) is the pattern to use for
percentage formatting. The pattern for use with scientific (exponent)
formatting is provided as \code{sci_format} (\emph{CLDR}: \code{'scientificFormats'}). The
pattern for use with currency formatting is found in \code{currency_format}
(\emph{CLDR}: \code{'currencyFormats'}). This format contains a few additional
structural options that allow proper placement of the currency symbol
relative to the numeric quantity. The \code{accounting_format} (\emph{CLDR}:
\code{'accountingFormats'}) pattern is to be used to generate accounting-style
formatting.
}

\keyword{datasets}
