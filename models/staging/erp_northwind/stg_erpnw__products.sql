WITH
    source_products AS (
        SELECT
            cast(product_id		as	int) as id_produto
            ,cast(product_name	as	string)	as nome_produto
            ,cast(supplier_id	as	string)	as id_fornecedor
            ,cast(category_id		as	int) as id_categoria
            ,cast(quantity_per_unit	as	string) as quantidade_por_unidade_produto
            ,unit_price as preco_por_unidade_produto
            ,cast(units_in_stock	as	int) as unidades_em_estoque_produto
            ,cast(units_on_order as	int) as unidades_na_ordem_produto
            ,cast(reorder_level	as	int) as ordem_de_reorg_produto
            ,case
            when discontinued = 1 then true else false end as
            descontinuado_s_n 
        from
        {{ source('erp','products') }}
    )

select * 
from source_products