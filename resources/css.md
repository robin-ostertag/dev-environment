CSS Reference

# Box Model

# Selectors




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