$(function() {
  searchByYear();
  showNextReport();
  // showPreviousReport();
})

// URL Variables
let searchURL = 'https://localhost:3000/expense_reports/by_year?utf8=%E2%9C%93&year='
let rootURL = 'https://localhost:3000'

// This will be used to search reports by year
const searchByYear = () => {
  $('#year').on('change', function() {
    let year = this.value;
    // I now have the search parameter in a variable and use it to query the database
    $.getJSON(searchURL + year).done(function(data) {
      // Clear the table
      let reportTable = $('#expense-report-table')
      reportTable.empty();
      // take the JSON data and render the search results
      data.map(reports => {
        let searchReports = new ExpenseReport(reports)
        let reportsHtml = searchReports.renderSearchResults()
        reportTable.append(reportsHtml);
      });
    })
  })
};

// This will be used to go through individual expense reports and display associated data
const showNextReport = () => {
  $('#next-report').on('click', function(e) {
    e.preventDefault();
    let nextId = parseInt($("#next-report").attr("data_id")) + 1;
    $.getJSON('/expense_reports/' + nextId, function(data){
      let expenseTable = $('#expenses-table')
      expenseTable.empty()

      // This updates the reports month and year
      let expenseReportTitle = $('#expense-report-details').text(`${data['month']} | ${data['year']}`)

      let expenses = data["expenses"]
      // This builds new expenses table with JSON data
      expenses.map(expenses => {
        let expenseList = new Expense(expenses)
        let reportExpenses = expenseList.renderReportExpenses();
        $(expenseTable).append(reportExpenses)
      });
      // This sets the data id to the current reports so it can properly load the next report
      $("#next-report").attr("data_id", data["id"]);
    })
  })
}

const showPreviousReport = () => {
  $('#prev-report').on('click', function(e) {
    e.preventDefault();
    let prevId = parseInt($("#next-report").attr("data_id")) - 1;
    console.log(prevId)
    $.getJSON('/expense_reports/' + prevId, function(data){
      let expenseTable = $('#expenses-table')
      expenseTable.empty()

      // This updates the reports month and year
      let expenseReportTitle = $('#expense-report-details').text(`${data['month']} | ${data['year']}`)

      let expenses = data["expenses"]
      // This builds new expenses table with JSON data
      expenses.map(expenses => {
        // debugger
        let expenseList = new Expense(expenses)
        let reportExpenses = expenseList.renderReportExpenses();
        $(expenseTable).append(reportExpenses)
      });
      // This sets the data id to the current reports so it can properly load the next report
      $("#prev-report").attr("data_id", data["id"]);
    })
  })
}

function ExpenseReport(report) {
  this.id = report.id;
  this.month = report.month;
  this.year = report.year;
  this.expenses = report.expenses
}

ExpenseReport.prototype.renderSearchResults = function() {
  let expenseReportHtml = `
    <tr id="${this.id}">
      <td id="expense-report-month">${this.month}</td>
      <td id="expense-report-year">${this.year}</td>
      <td id="expense-report-year"><a href="/expense_reports/${this.id}">View</a></td>
    </tr>
  `

  return expenseReportHtml;
}
