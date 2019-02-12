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
        // debugger
        // console.log(report)
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

function showEachReport() {
  $('#next-report').on('click', function() {
    console.log(this);
  })
}
