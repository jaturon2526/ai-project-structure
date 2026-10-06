# GPU Acceleration & 60fps Frame Budgeting

To maintain 60 frames per second, each frame must compute and render in under **16.67 milliseconds**.

### Browser Rendering Pipeline
1. **JavaScript** -> 2. **Style** -> 3. **Layout** -> 4. **Paint** -> 5. **Composite**

- Properties triggering **Layout + Paint + Composite** (Avoid in animations):
  `width`, `height`, `padding`, `margin`, `border`, `top`, `left`, `right`, `bottom`.
- Properties triggering **Paint + Composite** (Avoid in frequent loops):
  `color`, `background`, `box-shadow`, `border-radius`.
- Properties triggering **Composite Only** (Ideal for 60fps):
  `transform`, `opacity`.
