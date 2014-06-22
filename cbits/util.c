#include "util.h"

void friso_do_word(friso_t friso, friso_config_t config, friso_task_t task)
{
  while ( ( friso_next( friso, config, task ) ) != NULL ) {
    printf("%s \n", task->hits->word );
  }
}

/* for debug */
void friso_set_text_display(friso_task_t task, char* str)
{
  printf("%s\n", str);
  friso_set_text(task, str);
}
