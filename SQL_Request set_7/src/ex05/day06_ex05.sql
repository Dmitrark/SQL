COMMENT ON TABLE person_discounts IS 'Таблица показывает процент скидки выданную покупателю в зависимости от количества пиц из одной пицерии.';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный идентификатор пользователя.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный идентификатор пиццерии.';
COMMENT ON COLUMN person_discounts.discount is 'Процентный размер скидки выданный покупателю.';