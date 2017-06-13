module Api::V1
    class SuggestionsController < ApiController
        def create
            suggestion = Suggestion.create
        end
    
    private
        
    end
end
