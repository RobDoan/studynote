### Layout
------
### Principles
- **Seams**: Separate - move together
- **Steps**: overlapping- different z-positions (or depths - Move independently
- **Floating action button**: can straddle a step or seams.

### Units and Measurements

1. Pixel Density
  - Number of pixel that fit into a inch.
  - UI element appear physically larger on low-density than on high-density

    `screen_density = screen_width(px) / screen_width(inch)`
2. Density-independent pixels(dp)
  - only need to be used in developing for android  
    `dp = (width in pixels * 160) / screen density`
  - **When writing CSS, use px wherever dp or sp is stated**
3. Scaleable pixels (sp)
  - Same as dp, but for font which means that user has large font size setting will see the font size match to their size preference.
4. Designing layouts for dp
  - For Android

### Metrics & keylines
- [Design guidelines](https://material.io/guidelines/layout/metrics-keylines.html#metrics-keylines-keylines-spacing)
- All components align to an 8dp square baseline grid
- Iconography in toolbars align to a 4dp square baseline grid.
- Touch targets should be at least 48 x 48 dp

### Structure
1. Mobile:
  - app bar and floating button
  - bottom bar is optional
  - side nav overlay all other structures
2. Tablet
  - App bar + Floating buttons
  - App bar on table should get all item of app bar and bottom bar in mobile
  - bottom bar is optional or may be add when an action overflow.
  - Side nav overlays all other structures
  - Right bar can be accessed temporarily or pinned for permanent display.
3. Desktop
  - App bar + floating action buttons
  - Side nav can take up full height of screen size
  - Side nav can have their second toolbar
  - Content also can have their second toolbar
4. Notes:
  - Avoid slicing up the interface into too many regions which can cause L shapes. Instead, use whitespace to delineate secondary areas.
  - Use cards to organize content when specific behaviors are needed or if groupings of information need more separation than what whitespace or dividers can provide.

  
