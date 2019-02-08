$(function() {
  searchByYear()
})

// Variables
let rootURL = 'https://localhost:3000/expense_reports/by_year?utf8=%E2%9C%93&year='

// This will be used to search reports by year

function searchByYear() {
  $('#year').on('click', function(e) {
    e.preventDefault();
    console.log(this)

    // $.get(rootURL)
  })
}
