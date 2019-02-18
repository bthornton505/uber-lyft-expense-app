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

function getReportsData() {
  $('.report-link').on('click', function(e) {
    e.preventDefault()
    let reportLink = this['href']
    let reportLinkResults = $.get(reportLink)
    console.log(reportLinkResults)
  })
}

function showEachReport() {
  $('#next-report').on('click', function() {
    let nextId = parseInt($("#next-report").attr("data_id")) + 1;
    $.getJSON('/expense_reports/' + nextId, function(data){
      let expenseTable = $('#expenses-table')
      expenseTable.empty()
      // debugger
      // This updates the reports month and year
      let expenseReportTitle = $('#expense-report-details').text(`${data['expense_report'].month} | ${data['expense_report'].year}`)

      // let expenseReport = data
      let expenses = data["expenses"]
      let expenseList = expenses.map(function(expense) {
        // debugger
        result = "";
        result += '<tr id="' + expense.id + '">';
        // result += '<td class="expense-category">' + expense.category_id + '</td>';
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

// <a id="next-report" class="btn btn-secondary btn-sm" data_id="1" href="#">Next Report</a>
// <tbody>
//   <% @expenses.each do |expense| %>
//     <tr id="<%= expense.id %>">
//       <td class="expense-category"><%= expense.categories.last.name %></td>
//       <td class="expense-cost">$<%= expense.cost %></td>
//       <td class="expense-link"><%= link_to "View", expense_report_expense_path(@expense_report.id, expense) %></td>
//     </tr>
//   <% end %>
// </tbody>
