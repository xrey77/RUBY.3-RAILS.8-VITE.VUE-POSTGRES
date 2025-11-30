class Api::ProductController < ActionController::API
    
    def productsList
        found = false
        page = params[:page]
        perpage = 5
        offset = (page.to_i - 1) * perpage;
        totrecs = Product.all.count
        tot1 = (totrecs.to_f / perpage)
        totalpage = tot1.ceil

        @products = Product.limit(perpage).offset(offset)
        if @products.size > 0
            found = true
            # puts "No records found................."
        end

        if found
            render json: {
                page: page,
                totpage: totalpage,
                totalrecords: totrecs,
                products: @products,
            }, status: :ok
        else   
            render json: { 
                message: 'No record(s) found.'
                }, status: :unprocessable_entity                   
    
        end
    end

    def productsSearch
        found = false
        page = params[:page]
        @key = params[:keyword]
        perpage = 5
        offset = (page.to_i - 1) * perpage;
        totrecs = Product.all.filter_by_name(@key).count
        tot1 = (totrecs.to_f / perpage)
        totalpage = tot1.ceil

        @products = Product.filter_by_name(@key).limit(perpage).offset(offset)



        if @products.size > 0
            found = true
            # puts "No records found................."
        end

        if found
            render json: {
                page: page,
                totpage: totalpage,
                totalrecords: totrecs,
                products: @products,
            }, status: :ok
        else   
            render json: { 
                message: 'No record(s) found.'
                }, status: :unprocessable_entity                   
    
        end
    end


end
