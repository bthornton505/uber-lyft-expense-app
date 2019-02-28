// This will be used to search reports by year
const searchByYear = () => {
  $('#year').on('change', function() {
    let searchURL =
      'https://localhost:3000/expense_reports/by_year?utf8=%E2%9C%93&year='
    let year = this.value;
    // I now have the search parameter in a variable and use it to query the database
    $.getJSON(searchURL + year).done(function(data) {
      // Clear the table
      let reportTable = $('#expense-report-table')
      reportTable.empty();
      // take the JSON data, iterate each JSON objects, and render the search results
      data.forEach(reports => {
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
      // Clear the expense table
      let expenseTable = $('#expenses-table')
      expenseTable.empty()
      // This updates the reports month and year
      let expenseReportTitle = $('#expense-report-details').text(`${data['month']} | ${data['year']}`)
      // Update cost button with current data-id
      let sortExpensesByCost = $('#sort-cost').attr('data_id', data["id"])

      let expenses = data["expenses"]
      // Build the next reports expense table with JSON data
      expenses.forEach(expenses => {
        let expenseList = new Expense(expenses)
        let reportExpenses = expenseList.renderReportExpenses();
        $(expenseTable).append(reportExpenses)
      });
      // This sets the data id to the current reports so it can properly load the next report
      $("#next-report").attr("data_id", data["id"]);
    })
  })
}

// This doesn't work properly yet...
// const showPreviousReport = () => {
//   $('#prev-report').on('click', function(e) {
//     e.preventDefault();
//     let prevId = parseInt($("#next-report").attr("data_id")) - 1;
//     console.log(prevId)
//     $.getJSON('/expense_reports/' + prevId, function(data){
//       let expenseTable = $('#expenses-table')
//       expenseTable.empty()
//
//       // This updates the reports month and year
//       let expenseReportTitle = $('#expense-report-details').text(`${data['month']} | ${data['year']}`)
//
//       let expenses = data["expenses"]
//       // This builds new expenses table with JSON data
//       expenses.forEach(expenses => {
//         // debugger
//         let expenseList = new Expense(expenses)
//         let reportExpenses = expenseList.renderReportExpenses();
//         $(expenseTable).append(reportExpenses)
//       });
//       // This sets the data id to the current reports so it can properly load the next report
//       $("#prev-report").attr("data_id", data["id"]);
//     })
//   })
// }

const sortByCost = () => {
  $('#sort-cost').on('click', function(e) {
    e.preventDefault();
    let reportId = $(this).attr('data_id')

    $.getJSON('/expense_reports/' + reportId, function(data) {
      // Clear table of expenses to fill in new sorted expenses
      let sortedExpenseTable = $('#expenses-table')
      sortedExpenseTable.empty()

      let expenses = data['expenses']

      // Sort expenses by cost with most expensive at the top
      let sortedExpenses = expenses.sort(function(a, b) {
        return b.cost - a.cost;
      })
      // Take sorted expenses and create new table
      sortedExpenses.forEach(expenses => {
        let sortByCostExpenses = new Expense(expenses)
        let sortByCostHtml = sortByCostExpenses.renderReportExpenses()
        sortedExpenseTable.append(sortByCostHtml);
      });
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

$(function() {
  searchByYear();
  showNextReport();
  sortByCost();
  // showPreviousReport();
})

// TRIED CLASS CONSTRUCTOR SYNTAX BUT DOESN'T WORK YET

// class ExpenseReport {
//   constructor(id, month, year, expenses) {
//     this.id = id;
//     this.month = month;
//     this.year = year;
//     this.expenses = expenses
//   }
//
//   renderSearchResults() {
//     let expenseReportHtml = `
//       <tr id="${this.id}">
//         <td id="expense-report-month">${this.month}</td>
//         <td id="expense-report-year">${this.year}</td>
//         <td id="expense-report-year"><a href="/expense_reports/${this.id}">View</a></td>
//       </tr>
//     `
//
//     return expenseReportHtml;
//   }
// }
