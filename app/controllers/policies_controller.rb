class PoliciesController < ApplicationController

    def by_type
        policies = Policy.where(policy_type: params[:policy_type])
        render json: policies
      end
end
