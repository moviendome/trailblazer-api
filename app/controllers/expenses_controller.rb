# frozen_string_literal: true

class ExpensesController < AuthenticatedController
  def index
    run Expense::Operations::Index do
      return render json: ExpenseRepresenter.for_collection.new(@model), status: :ok
    end
  end

  def show
    run Expense::Operations::Show, params: params do
      return render json: ExpenseRepresenter.new(@model), status: :ok
    end

    render json: {
      message: "Not Found",
      errors: ""
    }, status: :not_found
  end

  def create
    run Expense::Operations::Create do
      return render json: ExpenseRepresenter.new(@model), status: :created
    end

    render json: {
      message: "Validation Failed",
      errors: @form.errors.messages
    }, status: :unprocessable_entity
  end
end
