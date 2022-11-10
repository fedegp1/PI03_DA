# PI02 - Machine Learning

### Intro

En este segundo proyecto de Henry se nos presentó el desafío en la modalidad de ***Datathon*** de crear un modelo que prediga (clasifique) si un aviso publicado en un portal de propiedades colombiano fuera barato o caro.

Se otorgó un set de datos de entrenamiento, y la organización reservó un set Ciego (los participantes no teníamos acceso a la clasificación real de ese set); el mismo se usó para que c/u envíe sus predicciones sobre ese test y los resultados fueran publicados en un Dashboard para evaluar y comparar los mejores modelos de todos los enviados por los participantes.

La métrica seleccionada para evaluar los modelos fue *recall*. Siendo esta la métrica principal, y como segunda métrica en relevancia, el *accuracy*.

Los datasets originales y las consignas se pueden encontrar en el siguiente repo: [https://github.com/soyHenry/Datathon](https://github.com/soyHenry/Datathon)

En el repo encontramos los siguientes archivos:

> *preprocessing.ipynb* - Notebook con todos los scripts, comentados y explicados sobre todo lo que se hizo. Desde el EDA, hasta la implementación de los modelos y los resultados.

> *df_train.csv* - el resultado de preprocesar todo el set de entrenamiento. para poder pasar directo a los modelos.

> *df_test.csv* - el resultado de aplicar los mismos procesos al set ciego.

> *df_palab.csv* - el resultado de un proceso largo, parte de la exploración de los datos, para no tener que generarlo con el script ya que demora mucho tiempo.

> *entregas* - en esta carpeta se encuentran las predicciones sobre el set ciego que se entregaron.

---

### Conclusiones / Resultados

Luego de todo el preprocesamiento de los datos, se instanciaron los siguientes modelos:

- Decision Tree.
- K-Neighbors
- Regresión Logística
- Random Forest

Cada uno presentó algunas variantes; se implementó el uso de GridSearch para establecer cuáles eran los mejores modelos.

Se obtuvo un buen resultado en Decision Tree, con los hiperparámetros optimizados mediante GridSearch; pero no fue el mejor. (Rec: 83% / Acc: 92%)

En el caso de la regresión Logística fue en el que se obtuvieron los peores resultados. (Rec: 35% / Acc: 80%)

Para K-Neighbors se obtuvo (Rec: 73% / Acc: 88% ). Pero no se lograron alcanzar buenos scores en la métrica principal solicitada.

En el caso de Random Forest, este fue el que mejor performó. En una primera instancia entregó valores similares a los obtenidos en DecTree, pero ligeramente superiores (Rec: 83% / Acc: 93%). Incluso probando modelos más avanzados, con features agregados (por exploracion de los datos en 'description') continuamos obteniendo valores en ese orden.

El salto de calidad con respecto a la predicción estuvo al sesgar la predicción haciendo uso de predict_proba, en lugar de predict. Sabemos que los modelos de clasificacion otorgan porcentajes de probabilidad a la pertenencia a una u otra clase. En este caso, al ser una clasificación binaria, al efectuar predicción nuestro modelo, si encuentra probabalidades similares, simplemente devuelve la más probable. Es decir si ante una instancia de predicción se encuentra con valores 51%/49% clasifica de acuerdo a esa probabilidad, con gran riesgo de clasificar mal porque las probabilidades están equiparadas.

Para aprovechar esto a mi favor, respetando la consigna de priorizar la métrica de recall. Decidí evaluar el comportamiento de este mejor modelo probando distintas configuraciones de asignación de clase (no solo 50/50). Por ejemplo que clasifique como clase relevante aunque tenga poca probabilidad de ocurrencia. Obviamente esto favorecerá el recall, en detrimento del accuracy; pero en qué medida? Para esto armé una grilla y clasifiqué los resultados de accuracy y reccall en base a predicciones con distintos valores de probabilidad.

Se resumen estos los resultados en el siguiente gráfico:

![](assets/20221104_212748_output.png)

Podemos observar del presente que se obtienen grandes mejoras en recall, al aumentar el grado de detección de la clase principal (en este caso tb es la minoritaria); pero no supone grandes sacrificios en términos de Accuracy. Decidimos optar por un valor de probabilidad de 28% (es decir ante un 28% de seguridad de que el aviso sea clasificado como caro, se decide clasificarlo como caro de todos modos). El cual entrega métricas de recall: 95% y accuracy 88%.

Por último, comparto el dashboard de resultados del ejercicio donde vemos los resultados de la aplicación de este modelo a la predicción del test Ciego; donde verificamos que se obtienen valores muy similares a los estimados en los ensayos previos sobre nuestro set de testeo; dando como resultado uno de los mejores modelos de predicción de todos los presentados.

![](assets/20221104_213133_rank.png)

---

### Etapas del pre-procesamiento

Generalidades y consideraciones destacadas.

Imputación de Lat / Lon y detección de Outliers en dichas columnas.

Extracción de información de la columna *'description'*. Features agregados en base a estos datos. Info extraida para poder imputar faltantes en otros features.

Selección de Features

---

### Modelado

Modelos empleados

Consideraciones particulares de c/u

Uso de pred_proba para sesgar la predicción y favorecer una de las clases. Impactando muy positivamente en Recall sin pérdida significativa en Accuracy.
