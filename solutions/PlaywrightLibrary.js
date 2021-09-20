function log_all_browser_requests(page, args) {
  page.on('request', request => console.log('>>', request.method(), request.url()));
  page.on('response', response => console.log('<<', response.status(), response.url()));
}

async function disable_styling_and_go_to_page(page, args) {
  await page.route(/(\.png$)|(\.jpg$)|(\.css$)/, route => route.abort());
  await page.goto(args[0]);
}

async function stub_endpoint_and_return_file(page, args) {
  endpoint = args[0]
  file = args[1]
  await page.route('**'+endpoint, route => {
    route.fulfill({ path: file, 'status': 202 });
  });
}

async function stub_endpoint_and_return_error(page, args) {
  endpoint = args[0]
  status_code = args[1]
  await page.route('**'+endpoint, route => {
    route.fulfill({ body: {'error': 'This is a stub'}, 'status': parseInt(status_code) });
  });
}

function find_and_log_all_console_errors(page, args) {
  page.on('console', async msg => {
    if (msg.type() == "error") {
      console.log('CONSOLE ERROR: ', msg.text())
    }
  });
}

exports.__esModule = true;
exports.log_all_browser_requests = log_all_browser_requests;
exports.disable_styling_and_go_to_page = disable_styling_and_go_to_page;
exports.stub_endpoint_and_return_file = stub_endpoint_and_return_file;
exports.stub_endpoint_and_return_error = stub_endpoint_and_return_error;
exports.find_and_log_all_console_errors = find_and_log_all_console_errors;
