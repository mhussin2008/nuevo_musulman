import 'package:flutter_treeview/flutter_treeview.dart';

List<Node> myNodesList = <Node>[];

void add_nodes() {
  myNodesList.addAll([
    Node(key: '1',
        label: '¿Qué es el Islam?'
    ,children: [
      Node(key:'1.1',label: 'Los Fundamentos del Islam'
      ,children: [Node(key:'1.1.1',label: '¿Que significa la palabra el Islam?',children: [
        Node(key: '1.1.1.1', label: '''◽El Islam es la religión de más de 1,7 billones en el mundo, provee a la humanidad con una visión unificada sobre el propósito de nuestra creación y existencia, nuestro destino final y nuestra posición entre otras criaturas. 

  ◽El islam no es una nueva religión, sino es más que el desarrollo práctico de la sumisión a Diós , desde Adán hasta Muhámmad.

  ↪️La sumisión a Diós significa : obedecer su órdenes , realizar su legislaciónes y rechazar todo lo que prohíbe.

  🔹La creencia básica es que La Unicidad de Diós , que es  adorar a único Diós (Alláh) sin socios ni hijo .
  También no hay intermediario entre el siervo y Su señor.

  🔹El Islam es puro y simplemente vive de acuerdo con lo que Diós quiere y ordena.

  🔺El islam es un conjunto de leyes y enseñanzas, que se incluyen al tratamiento bueno entre todas las personas en la sociedad.
  Una forma de vida que concuerda con la naturaleza, la razón, la lógica y la ciencia.

  🔺Sólo con el islam llega a la paz interior del corazón y la vida  equilibrada.''')
          ])

          ]
      )
        ],
    )
  ]);
}