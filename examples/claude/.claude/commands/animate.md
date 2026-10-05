# /animate Command

Generate smooth, high-performance CSS keyframe animations for web application UI components.

## Instructions
1. Review the target HTML element or component (card, button, modal, loader, chart).
2. Adhere strictly to 60fps GPU-accelerated rules:
   - **Allowed animated properties**: `transform` (translate3d, scale, rotate) and `opacity`.
   - **Forbidden animated properties**: `width`, `height`, `top`, `left`, `margin`, `padding` (causes layout reflow).
3. Always wrap animations with `@media (prefers-reduced-motion: reduce)` fallback for accessibility.
4. Output CSS with clear class names (e.g., `.animate-fade-up`, `.animate-pulse-glow`, `.animate-shimmer`).
5. Provide a preview snippet showing how to apply the classes to HTML elements.
