local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local snippets = {
  s("rncomponent", {
    t({
      "import React from 'react';",
      "import { View, Text } from 'react-native';",
      "import styles from './cmp.styles.ts",
      "",
      "interface Props {",
      "  // define your props here",
      "}",
      "",
      "",
      "const cmp = ({}: Props) => {",
      "  return (",
      "    <View style={styles.container}>",
      "      <Text>",
      "</Text>",
      "    </View>",
      "  );",
      "};",
      "",
      "export default cmp;"
    })
  }),
  s("rnstyle", {
    t({ "import { StyleSheet } from 'react-native';", "", "const styles = StyleSheet.create({", "", "});", "",
      "export default styles;" })
  })
}

ls.add_snippets("typescript", snippets)
ls.add_snippets("typescriptreact", snippets)
