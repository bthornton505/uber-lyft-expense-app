$(function() {
  searchByYear()
})

// Variables
let searchURL = 'https://localhost:3000/expense_reports/by_year?utf8=%E2%9C%93&year='

// This will be used to search reports by year

function searchByYear() {
  $('#year').on('change', function() {
    let year = this.value;
    // I now have the search parameter in a variable and use it to query the database
    $.get(searchURL + year, function(data) {
      let reportsTable = $('#expense-report-table');
      reportsTable.empty()

      let searchResults = data.map(function(report) {
        let reportMonth = $('td#expense-report-month').text(report.month);
        let reportYear = $('td#expense-report-year').text(report.year);
        let reportLink = $('td#expense-report-link').text(`<a href="/expense_reports/${report.id}">View</a>`);

        return reportMonth;
        return reportYear;
        return reportLink;
      });
      // After sending a get request for the reports, I need to hijack the submit button
      // which will then arrange the data into the table properly (i hope)
    })
  })
}
