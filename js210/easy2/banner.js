function logInBox(text) {
  let dash = '-';
  let space = ' ';
  console.log(`+-${dash.repeat(text.length)}-+`);
  console.log(`| ${space.repeat(text.length)} |`);
  console.log(`| ${text} |`);
  console.log(`| ${space.repeat(text.length)} |`);
  console.log(`+-${dash.repeat(text.length)}-+`);
}

logInBox('To boldly go where no one has gone before.')
logInBox('')