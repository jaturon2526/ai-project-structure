---
name: css-animation
description: >-
  Designs high-performance, 60fps GPU-accelerated CSS animations. Use this skill
  when asked to create CSS keyframes, add animated cards, micro-interactions,
  shimmer effects, or optimize web animation performance.
---

# CSS Animation Engineering Skill

This skill guides the agent in authoring hardware-accelerated CSS animations that do not trigger layout reflow or repaint.

## Core Directives

1. **Hardware Accelerated Properties Only**:
   - Only animate `transform` (e.g., `translate3d`, `scale3d`, `rotate3d`) and `opacity`.
   - Never animate `width`, `height`, `margin`, `padding`, `top`, `bottom`, `left`, `right`.

2. **Layer Promotion**:
   - Apply `will-change: transform;` on persistently animated cards or widgets to promote them to their own compositor layer.

3. **Accessibility (Reduced Motion)**:
   - Always enclose keyframes or utility classes with a fallback:
     ```css
     @media (prefers-reduced-motion: reduce) {
       .animated-element {
         animation: none !important;
         transition: none !important;
       }
     }
     ```

4. **Reference Implementation**:
   - See [GPU Acceleration Reference](./resources/gpu-rules.md) for 60fps frame budgeting.
