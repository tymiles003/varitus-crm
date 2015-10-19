<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/
$languageStrings = array(
	'LBL_IMPORT_STEP_1'            => 'Шаг 1'                      , 
	'LBL_IMPORT_STEP_1_DESCRIPTION' => 'Выберите Файл'                 , 
	'LBL_IMPORT_SUPPORTED_FILE_TYPES' => 'Поддерживаемый тип файла (ы):.. CSV, VCF', 
	'LBL_IMPORT_STEP_2'            => 'Шаг 2'                      , 
	'LBL_IMPORT_STEP_2_DESCRIPTION' => 'Укажите формат'              , 
	'LBL_FILE_TYPE'                => 'Тип файла'                   , 
	'LBL_CHARACTER_ENCODING'       => 'Кодировка символов'          , 
	'LBL_DELIMITER'                => 'Разделитель:'     , 
	'LBL_HAS_HEADER'               => 'Заголовок:'         , 
	'LBL_IMPORT_STEP_3'            => 'Шаг 3'                      , 
	'LBL_IMPORT_STEP_3_DESCRIPTION' => 'Дубликат обработка Рекорд'   , 
	'LBL_IMPORT_STEP_3_DESCRIPTION_DETAILED' => 'Выберите эту опцию, чтобы включить и настроить дубликат объединить критерии', 
	'LBL_SPECIFY_MERGE_TYPE'       => 'Выберите, как повторяющиеся записи должны быть обработаны', 
	'LBL_SELECT_MERGE_FIELDS'      => 'Выберите подходящие поля для поиска повторяющихся записей', 
	'LBL_AVAILABLE_FIELDS'         => 'Доступные Поля' , 
	'LBL_SELECTED_FIELDS'          => ' Поля для обработки', 
	'LBL_NEXT_BUTTON_LABEL'        => 'Далее'                  , 
	'LBL_IMPORT_STEP_4'            => 'Шаг 4'                      , 
	'LBL_IMPORT_STEP_4_DESCRIPTION' => 'Сопоставьте столбцов в модуле полей', 
	'LBL_FILE_COLUMN_HEADER'       => 'Заголовок'                      , 
	'LBL_ROW_1'                    => 'Ряд 1'                       , 
	'LBL_CRM_FIELDS'               => 'CRM Поля'                  , 
	'LBL_DEFAULT_VALUE'            => 'Значение по умолчанию'               , 
	'LBL_SAVE_AS_CUSTOM_MAPPING'   => 'Сохранить как заказ карт '     , 
	'LBL_IMPORT_BUTTON_LABEL'      => 'Импорт'                , // KEY 5.x: LBL_IMPORT
	'LBL_RESULT'                   => 'Result'                      , 
	'LBL_TOTAL_RECORDS_IMPORTED'   => 'Записи успешно импортированных', 
	'LBL_NUMBER_OF_RECORDS_CREATED' => 'Отчеты, созданные'             , 
	'LBL_NUMBER_OF_RECORDS_UPDATED' => 'Отчеты перезаписаны'         , 
	'LBL_NUMBER_OF_RECORDS_SKIPPED' => 'Пропускается записей'             , 
	'LBL_NUMBER_OF_RECORDS_MERGED' => 'Объединены записей'              , 
	'LBL_TOTAL_RECORDS_FAILED'     => 'Записи не удалось импортировать'    , 
	'LBL_IMPORT_MORE'              => 'Импортировать Больше', 
	'LBL_VIEW_LAST_IMPORTED_RECORDS' => 'Последний Imported отчеты'       , 
	'LBL_UNDO_LAST_IMPORT'         => 'Отменить последний Импорт', 
	'LBL_FINISH_BUTTON_LABEL'      => 'Финиш'                  , // KEY 5.x: LBL_FINISH
	'LBL_UNDO_RESULT'              => 'Отменить Импорт Результат'          , 
	'LBL_TOTAL_RECORDS'            => 'Общее количество записей'     , 
	'LBL_NUMBER_OF_RECORDS_DELETED' => 'Количество записей удаленных'   , 
	'LBL_OK_BUTTON_LABEL'          => 'Хорошо'                          , 
	'LBL_IMPORT_SCHEDULED'         => 'Импорт по расписанию'            , 
	'LBL_RUNNING'                  => 'работа'                , 
	'LBL_CANCEL_IMPORT'            => 'Отменить Импорт'               , 
	'LBL_ERROR'                    => 'Ошибка:'               , 
	'LBL_CLEAR_DATA'               => 'Очистка данных'                  , 
	'ERR_UNIMPORTED_RECORDS_EXIST' => 'Невозможно импортировать больше данных в этой партии. Пожалуйста, начните новый импорт.', 
	'ERR_IMPORT_INTERRUPTED'       => 'Текущий Импорт была прервана. Пожалуйста, повторите попытку позже', 
	'ERR_FAILED_TO_LOCK_MODULE'    => 'Не удалось заблокировать модуль для импорта. Re-повторите попытку позже', 
	'LBL_SELECT_SAVED_MAPPING'     => 'Выберите сохраненный Mapping'        , 
	'LBL_IMPORT_ERROR_LARGE_FILE'  => 'Ошибка импорта больших файлов '    , 
	'LBL_FILE_UPLOAD_FAILED'       => 'Загрузка файлов удалось'          , 
	'LBL_IMPORT_CHANGE_UPLOAD_SIZE' => 'Импорт Изменение Загрузить Размер'   , 
	'LBL_IMPORT_DIRECTORY_NOT_WRITABLE' => 'Импорт Справочник не доступна для записи', 
	'LBL_IMPORT_FILE_COPY_FAILED'  => 'Копия Импорт файла не удалось'     , 
	'LBL_INVALID_FILE'             => 'Неверный файл'                , 
	'LBL_NO_ROWS_FOUND'            => 'Не строк не найдено'               , 
	'LBL_SCHEDULED_IMPORT_DETAILS' => 'Ваш импорта был запланирован и начнется в течение 15 минут. Вы получите по электронной почте после завершения импорта.  <br> <br>
										Пожалуйста, убедитесь, что Сервер исходящей почты и адрес электронной почты настроен на получение уведомлений по электронной почте', 
	'LBL_DETAILS'                  => 'Детали'                     , 
	'skipped'                      => 'Пропущенные отчеты'             , 
	'failed'                       => 'Ошибка записи'              , 
);