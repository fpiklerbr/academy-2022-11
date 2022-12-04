WITH
    source_categories AS (
        SELECT
            cast(category_id as int) as id_categorias
            ,cast(category_name as string) as nome_categoria
            ,cast(description as string) as descricao_categoria
        from
        {{ source('erp','categories') }}
    )

select * 
from source_categories