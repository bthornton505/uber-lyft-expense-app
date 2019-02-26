$(document).ready(function() {
  addComment();
});

const addComment = () => {
  $('#new_comment').on('submit', function(e) {
    let data = $(this).serialize();
    url = this.action

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        $('#comment_description').val("");
        let $ul = $('#expense-comments')
        $ul.append(response);
      }
    })

    e.preventDefault();
  })
};

function Expense(expense) {
  this.id = expense.id;
  this.month = expense.month;
  this.cost = expense.cost;
  this.expense_report_id = expense.expense_report_id;
  this.category = expense.category;
  this.comments = expense.commments;
}

Expense.prototype.renderReportExpenses = function() {
  let reportExpenses = `
    <tr id="${this.id}">
      <td class="expense-category">${this['category'].name}</td>
      <td class="expense-cost">$${this.cost}</td>
      <td class="expense-link"><a href="/expense_reports/${this.expense_report_id}/expenses/${this.id}">View</a></td>
    </tr>
  `

  return reportExpenses;
}

// TRIED TO USE CLASS CONSTRUCTOR SYNTAX BUT DOESN'T WORK YET
// class Expense {
//   constructor(id, month, cost, expense_report_id, category, comments) {
//     this.id = id;
//     this.month = month;
//     this.cost = cost;
//     this.expense_report_id = expense_report_id;
//     this.category = category;
//     this.comments = commments;
//   }
//
//   renderReportExpenses() {
//     let reportExpenses = `
//       <tr id="${this.id}">
//         <td class="expense-category">${this['category'].name}</td>
//         <td class="expense-cost">$${this.cost}</td>
//         <td class="expense-link"><a href="/expense_reports/${this.expense_report_id}/expenses/${this.id}">View</a></td>
//       </tr>
//     `
//
//     return reportExpenses;
//   }
// }
