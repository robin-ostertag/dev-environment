CSS Reference

# Box Model


# Selectors

It is only possible to select downwards.

## Simple selectors

- universal: `*` {}
- type: `section` {}
- class: `.my-class` {}
- id: `#myId` {}
- attribute: `[data-type='primary']` {}

Group multiple seperators by seperating them with commas.

## Pseudo-classes

For specific platform state (=> HTML element is in specified state)
- syntax : `:`

List:

- `a:hover`
- `p:nth-child(even)`

## Pseudo-elements

Act as if they are inserting new elements.
- syntax: `::`

## Complex selectors

### Selector Combinators:
- descendant combinator: ` ` (whitespace)
    - children
- Child combinator: `>`
    - direct children
- next sibling combinator: `+`
    - element that immediately follows another element (with the same parent)
    - A+B would work for `<parent>A, B, C</parent>`
    - typical use: `.my-class * + *` 
        => select every child with my-class as parent, execpt the first child.
- Subsequent- sibling combinator: `~`
    - element has to follow another element with the same parent
    => elements just have to share the same parent (no matter if elements are in between)
    - A~C would work for `<parent>A, B, C</parent>`, while A+B would not

### Compound selectors

When combining multiple selectors.


# Specificity

![css specificity](images/css_specificity.png)


# Cascade

The cascade is the algorithm for solving conflicts where multiple CSS rules apply to an HTML element:

1. Position
    - latest (bottom) wins
2. Specificity
    - higher specificy wins
3. Origin
    - User agent base styles: browser applied defaults
    - Local user styles: from the operating system (e.g. base font size)
    - authored css: css you write yourself

![css order of origins](images/css_origin_order.png)
4. Importance


# Inheritence

-todo: when is a property inherited?
- => every property always has a value!


# Sources
Sources for this document: [https://web.dev/learn/css](https://web.dev/learn/css)