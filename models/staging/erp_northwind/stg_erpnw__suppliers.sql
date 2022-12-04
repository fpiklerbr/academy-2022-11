WITH
    source_suppliers AS (
        SELECT
        cast(supplier_id as string) as id_fornecedor
        ,cast(company_name as string) as nome_compania_fornecedor				
        ,cast(contact_name	as string) as nome_contato_fornecedor		
        ,cast(contact_title as string) as titulo_contato_fornecedor		
        ,cast(address as string) as endereco_cliente_fornecedor				
        ,cast(city as string) as cidade_cliente_fornecedor		
        ,cast(region as string) as regiao_cliente_fornecedor			
        ,cast(postal_code as string) as caixa_postal_fornecedor
        ,cast(country as string) as pais_cliente_fornecedor
        ,cast(phone as string) as fone_cliente_fornecedor
        ,cast(fax as string) as fax_cliente_fornecedor
        --,cast(homepage as string) as homepage_cliente		
        from
        {{ source('erp','suppliers') }}
    )

select * 
from source_suppliers