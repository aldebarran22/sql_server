

create or alter view vista_pedidos_Alemania as
(select [PaísDestinatario], cargo from pedidos
where [PaísDestinatario] = 'Alemania');