const docReady = fn => {
  // see if DOM is already available
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', fn);
  } else {
    setTimeout(fn, 1);
  }
};

/* ----------------------------- Colors function ---------------------------- */

const hexToRgb = hexValue => {
  let hex;
  hexValue.indexOf('#') === 0 ? (hex = hexValue.substring(1)) : (hex = hexValue);
  // Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
  const shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(
    hex.replace(shorthandRegex, (m, r, g, b) => r + r + g + g + b + b)
  );
  return result
    ? [parseInt(result[1], 16), parseInt(result[2], 16), parseInt(result[3], 16)]
    : null;
};

const rgbaColor = (color = '#fff', alpha = 0.5) => `rgba(${hexToRgb(color)}, ${alpha})`;

/* --------------------------------- Colors --------------------------------- */

const getColor = (name, dom = document.documentElement) =>
  getComputedStyle(dom).getPropertyValue(`--falcon-${name}`).trim();

const getColors = dom => ({
  primary: getColor('primary', dom),
  secondary: getColor('secondary', dom),
  success: getColor('success', dom),
  info: getColor('info', dom),
  warning: getColor('warning', dom),
  danger: getColor('danger', dom),
  light: getColor('light', dom),
  dark: getColor('dark', dom)
});

const getSoftColors = dom => ({
  primary: getColor('soft-primary', dom),
  secondary: getColor('soft-secondary', dom),
  success: getColor('soft-success', dom),
  info: getColor('soft-info', dom),
  warning: getColor('soft-warning', dom),
  danger: getColor('soft-danger', dom),
  light: getColor('soft-light', dom),
  dark: getColor('soft-dark', dom)
});

const getGrays = dom => ({
  white: getColor('white', dom),
  100: getColor('100', dom),
  200: getColor('200', dom),
  300: getColor('300', dom),
  400: getColor('400', dom),
  500: getColor('500', dom),
  600: getColor('600', dom),
  700: getColor('700', dom),
  800: getColor('800', dom),
  900: getColor('900', dom),
  1000: getColor('1000', dom),
  1100: getColor('1100', dom),
  black: getColor('black', dom)
});


const settings = {
  tinymce: {
    theme: 'oxide'
  },
  chart: {
    borderColor: 'rgba(255, 255, 255, 0.8)'
  }
};

export { docReady, rgbaColor, getColors, getSoftColors, getGrays, settings };