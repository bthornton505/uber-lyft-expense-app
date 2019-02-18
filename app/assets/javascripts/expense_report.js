$(document).ready(function() {
  searchByYear();
  showEachReport();
})

// Variables
let searchURL = 'https://localhost:3000/expense_reports/by_year?utf8=%E2%9C%93&year='
let rootURL = 'https://localhost:3000'

// This will be used to search reports by year
function searchByYear() {
  $('#year').on('change', function() {
    let year = this.value;
    // I now have the search parameter in a variable and use it to query the database
    $.getJSON(searchURL + year).done(function(data) {
      // Clear the table
      let reportTable = $('#expense-report-table')
      reportTable.empty();

      let searchResults = data.map(function(report) {
        console.log(report)
        let result = "";
        result += '<tr id="' + report.id + '">';
        result += '<td id="expense-report-month">' + report.month + '</td>';
        result += '<td id="expense-report-year">' + report.year + '</td>';
        result += `<td id="expense-report-year"><a href="/expense_reports/${report.id}">View</a></td>`;

        return result;
      });

      reportTable.append(searchResults);
    })
  })
};

// This will be used to go through individual expense reports and display associated data 
function showEachReport() {
  $('#next-report').on('click', function() {
    let nextId = parseInt($("#next-report").attr("data_id")) + 1;
    $.getJSON('/expense_reports/' + nextId, function(data){
      let expenseTable = $('#expenses-table')
      expenseTable.empty()

      // This updates the reports month and year
      let expenseReportTitle = $('#expense-report-details').text(`${data['month']} | ${data['year']}`)

      let expenses = data["expenses"]
      // This builds new expenses table with JSON data
      let expenseList = expenses.map(function(expense) {

        result = "";
        result += '<tr id="' + expense.id + '">';
        result += '<td class="expense-category">' + expense['category'].name + '</td>';
        result += '<td class="expense-cost">$' + expense.cost + '</td>';
        result += `<td class="expense-link"><a href="/expense_reports/${expense.expense_report_id}/expenses/${expense.id}">View</a></td>`;

        return result;
      })

      $(expenseTable).append(expenseList)
      // This sets the data id to the current reports so it can properly load the next report
      $("#next-report").attr("data_id", data["id"]);
    })
  })
}
