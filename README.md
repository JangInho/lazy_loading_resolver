# lazy_loading_resolver

lazy loading 이 있는 위젯들에서 Scrollable.ensureVisible()을 잘 사용하는 법이 있을까?

## 문제 상황
반복되는 셀이 있는 UI를 구현할 때, shrinkWrap: true or SingleChildScrollView 같이 모든 아이템을 한 번에 렌더링하는 위젯을 사용하면 성능 이슈가 있음

-> 그럼 lazy loading을 사용하는 위젯들인 ListView.builder, CustomScrollView를 사용하면 되겠다!

  -> 만약 특정 요소로 이동해야하는 경우 문제가 생김

    -> lazy loading으로 아직 렌더링 되지 않은 아이템으로 Scrollalble.ensureVisible() 작동하지 않음
    
