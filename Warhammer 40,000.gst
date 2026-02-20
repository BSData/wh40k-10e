<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem xmlns="http://www.battlescribe.net/schema/gameSystemSchema" id="sys-352e-adc2-7639-d6a9" name="Warhammer 40,000 10th Edition" revision="90" battleScribeVersion="2.03" type="gameSystem">
  <publications>
    <publication id="48fc-15aa-b307-9443" name="10th Edition Core Rules" shortName="10th Ed Core"/>
    <publication name="Github" hidden="false" id="8db3-575d-91b-47f8" shortName="BSData/wh40k-10e" publisherUrl="https://github.com/BSData/wh40k-10e"/>
  </publications>
  <costTypes>
    <costType id="51b2-306e-1021-d207" name="pts" defaultCostLimit="-1" hidden="false">
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="atLeast" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="self" childId="roster" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </costType>
    <costType name="Crusade Points" id="b03b-c239-15a5-da55" defaultCostLimit="-1" hidden="true">
      <modifiers>
        <modifier type="set" value="false" field="hidden" scope="roster">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="self" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </costType>
    <costType name="Crusade: Battle Honours" id="75bb-ded1-c86d-bdf0" defaultCostLimit="-1" hidden="true">
      <comment>Tracking number for Crusade</comment>
    </costType>
    <costType name="Crusade: Experience" id="a623-fe74-1d33-cddf" defaultCostLimit="-1" hidden="true">
      <comment>Tracking number for Crusade</comment>
    </costType>
    <costType name="Crusade: Weapon Modifications" id="716d-91b7-d55a-1022" defaultCostLimit="-1" hidden="true">
      <comment>Tracking number for Crusade</comment>
    </costType>
    <costType name="Blackstone Fragments" id="ac6b-ced3-9b5e-9a6e" defaultCostLimit="-1" hidden="true">
      <comment>Crusade content</comment>
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <conditions>
            <condition type="instanceOf" field="selections" scope="self" childId="66c2-2a46-e7ed-a935"/>
          </conditions>
        </modifier>
      </modifiers>
    </costType>
  </costTypes>
  <profileTypes>
    <profileType id="c547-1836-d8a-ff4f" name="Unit">
      <characteristicTypes>
        <characteristicType id="e703-ecb6-5ce7-aec1" name="M"/>
        <characteristicType id="d29d-cf75-fc2d-34a4" name="T"/>
        <characteristicType id="450-a17e-9d5e-29da" name="SV"/>
        <characteristicType id="750a-a2ec-90d3-21fe" name="W"/>
        <characteristicType id="58d2-b879-49c7-43bc" name="LD"/>
        <characteristicType id="bef7-942a-1a23-59f8" name="OC"/>
      </characteristicTypes>
    </profileType>
    <profileType id="f77d-b953-8fa4-b762" name="Ranged Weapons">
      <characteristicTypes>
        <characteristicType id="9896-9419-16a1-92fc" name="Range"/>
        <characteristicType id="3bb-c35f-f54-fb08" name="A"/>
        <characteristicType id="94d-8a98-cf90-183e" name="BS"/>
        <characteristicType id="2229-f494-25db-c5d3" name="S"/>
        <characteristicType id="9ead-8a10-520-de15" name="AP"/>
        <characteristicType id="a354-c1c8-a745-f9e3" name="D"/>
        <characteristicType id="7f1b-8591-2fcf-d01c" name="Keywords"/>
      </characteristicTypes>
    </profileType>
    <profileType id="9cc3-6d83-4dd3-9b64" name="Abilities">
      <characteristicTypes>
        <characteristicType id="9b8f-694b-e5e-b573" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType id="8a40-4aaa-c780-9046" name="Melee Weapons">
      <characteristicTypes>
        <characteristicType id="914c-b413-91e3-a132" name="Range"/>
        <characteristicType id="2337-daa1-6682-b110" name="A"/>
        <characteristicType id="95d1-95f-45b4-11d6" name="WS"/>
        <characteristicType id="ab33-d393-96ce-ccba" name="S"/>
        <characteristicType id="41a0-1301-112a-e2f2" name="AP"/>
        <characteristicType id="3254-9fe6-d824-513e" name="D"/>
        <characteristicType id="893f-9000-ccf7-648e" name="Keywords"/>
      </characteristicTypes>
    </profileType>
    <profileType id="74f8-5443-9d6d-1f1e" name="Transport">
      <characteristicTypes>
        <characteristicType id="30f2-be70-861d-1b84" name="Capacity"/>
      </characteristicTypes>
    </profileType>
  </profileTypes>
  <categoryEntries>
    <categoryEntry id="9cfd-1c32-585f-7d5c" name="Character" hidden="false"/>
    <categoryEntry id="4f3a-f0f7-6647-348d" name="Epic Hero" hidden="false"/>
    <categoryEntry id="cf47-a0d7-7207-29dc" name="Infantry" hidden="false"/>
    <categoryEntry id="9693-cf84-fe69-37a9" name="Monster" hidden="false"/>
    <categoryEntry id="e338-111e-d0c6-b687" name="Battleline" hidden="false"/>
    <categoryEntry id="ba07-411c-2832-1f79" name="Dedicated Transport" hidden="false"/>
    <categoryEntry id="14a0-40c9-2748-ae6e" name="Mounted" hidden="false"/>
    <categoryEntry id="2d7f-1892-2fd0-e29c" name="Captain" hidden="false"/>
    <categoryEntry id="5a61-81ac-eb7c-a87e" name="Grenades" hidden="false"/>
    <categoryEntry id="aff3-d6a3-2a95-9dc" name="Imperium" hidden="false"/>
    <categoryEntry id="4ac9-fd30-1e3d-b249" name="Configuration" hidden="false"/>
    <categoryEntry id="1160-70ae-a862-b1a8" name="Unit" hidden="false"/>
    <categoryEntry id="c619-2086-bbcf-69c9" name="Fly" hidden="false">
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry id="6df-937-16bc-8c1a" name="Smoke" hidden="false"/>
    <categoryEntry id="13bf-2bee-3ae0-b414" name="Psyker" hidden="false"/>
    <categoryEntry id="dbd4-63-af05-998" name="Vehicle" hidden="false"/>
    <categoryEntry id="6dda-e157-334d-e93a" name="Walker" hidden="false"/>
    <categoryEntry id="75e8-57c4-40e3-1817" name="Transport" hidden="false"/>
    <categoryEntry id="63f1-e6e8-f6f6-a4f0" name="Aircraft" hidden="false"/>
    <categoryEntry id="19d7-9c74-2140-5851" name="Fortification" hidden="false"/>
    <categoryEntry id="d666-e2c9-b6cc-5716" name="Towering" hidden="false"/>
    <categoryEntry id="5929-ad51-d006-e008" name="Titanic" hidden="false"/>
    <categoryEntry id="4c3e-9310-a516-3590" name="Beast" hidden="false"/>
    <categoryEntry id="4c00-2578-faf5-6918" name="Chaos" hidden="false"/>
    <categoryEntry id="bb67-f191-6562-acc7" name="Faction: Chaos Knights" hidden="false"/>
    <categoryEntry id="d1d8-6ae0-1be7-e9e" name="Faction: Tyranids" hidden="false">
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="force" shared="true" id="10a0-a45c-f379-bb06" includeChildSelections="true" includeChildForces="false"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="500" field="10a0-a45c-f379-bb06" id="d345-5a54-3609-7600">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="false"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1000" field="10a0-a45c-f379-bb06" id="8a58-5a9f-9d23-5682">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="false"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1500" field="10a0-a45c-f379-bb06" id="8438-8892-1129-d075">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="false"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry id="1015-db48-a2fa-c7da" name="Faction: Drukhari" hidden="false">
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="force" shared="true" id="4d8f-6e09-606e-788e" includeChildSelections="true" includeChildForces="false"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="500" field="4d8f-6e09-606e-788e" id="f5a0-b59-1410-a903">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="38de-521f-1ce0-44a0" shared="true" includeChildSelections="false"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1000" field="4d8f-6e09-606e-788e" id="2e33-3f3b-a0f6-a6bd">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="38de-521f-1ce0-44a0" shared="true" includeChildSelections="false"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1500" field="4d8f-6e09-606e-788e" id="2e5f-b5f2-28bb-573e">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="38de-521f-1ce0-44a0" shared="true" includeChildSelections="false"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry id="4378-1827-4988-be4e" name="Faction: Asuryani" hidden="false"/>
    <categoryEntry id="fa45-57e-930e-602b" name="Faction: Astra Militarum" hidden="false"/>
    <categoryEntry id="b5e4-3253-c157-54fd" name="Faction: Imperial Knights" hidden="false">
      <modifiers>
        <modifier type="set" value="1" field="807c-44c1-6f7d-dfb8">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildForces="false"/>
                <condition type="equalTo" value="0" field="selections" scope="force" childId="4c40-ab9-54af-d290" shared="true"/>
              </conditions>
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="e4d6-1a77-132b-f39d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="af4c-b971-a31c-669c" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="481c-3b2e-5c99-c248" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="f76f-29c1-de9-74c2" shared="true" includeChildSelections="true" includeChildForces="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="3" field="807c-44c1-6f7d-dfb8">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildForces="false"/>
                <condition type="atLeast" value="1" field="selections" scope="force" childId="4c40-ab9-54af-d290" shared="true"/>
              </conditions>
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="equalTo" value="0" field="selections" scope="roster" childId="e4d6-1a77-132b-f39d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="equalTo" value="0" field="selections" scope="roster" childId="af4c-b971-a31c-669c" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="equalTo" value="0" field="selections" scope="roster" childId="f76f-29c1-de9-74c2" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="equalTo" value="0" field="selections" scope="roster" childId="481c-3b2e-5c99-c248" shared="true" includeChildSelections="true" includeChildForces="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="0" field="807c-44c1-6f7d-dfb8">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildForces="false"/>
                <condition type="atLeast" value="1" field="selections" scope="force" childId="4c40-ab9-54af-d290" shared="true"/>
              </conditions>
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="e4d6-1a77-132b-f39d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="af4c-b971-a31c-669c" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="f76f-29c1-de9-74c2" shared="true" includeChildSelections="true" includeChildForces="true"/>
                    <condition type="greaterThan" value="0" field="selections" scope="roster" childId="481c-3b2e-5c99-c248" shared="true" includeChildSelections="true" includeChildForces="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="-1" field="selections" scope="force" shared="true" id="807c-44c1-6f7d-dfb8" includeChildSelections="true" includeChildForces="true"/>
      </constraints>
    </categoryEntry>
    <categoryEntry id="1e42-dfae-cbdd-207d" name="Faction: Heretic Astartes" hidden="false">
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="force" shared="true" id="fbba-7f7e-16a1-370a" includeChildSelections="true"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="500" field="fbba-7f7e-16a1-370a" id="4fa7-457c-8229-7e77">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="c8da-e875-58f7-f6d6" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1000" field="fbba-7f7e-16a1-370a" id="94e5-8ddd-5373-00cf">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="c8da-e875-58f7-f6d6" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1500" field="fbba-7f7e-16a1-370a" id="a7d0-0334-fd3e-416b">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="c8da-e875-58f7-f6d6" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry id="fd71-afa6-b13b-7fda" name="Faction: Adepta Sororitas" hidden="false"/>
    <categoryEntry id="ee0-cf31-4fb5-6b26" name="Faction: Necrons" hidden="false"/>
    <categoryEntry id="571f-ec3a-a5a2-751a" name="Faction: Legiones Daemonica" hidden="false">
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="force" shared="true" id="f70b-465d-493f-52e3" includeChildSelections="true"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="250" field="f70b-465d-493f-52e3" id="4796-8c50-4a43-66c8">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="d265-877b-e03d-30ca" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="500" field="f70b-465d-493f-52e3" id="bc6-87f4-482b-c1cd">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="d265-877b-e03d-30ca" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="750" field="f70b-465d-493f-52e3" id="b336-af46-e756-ab15">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="d265-877b-e03d-30ca" shared="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry id="b2a9-ede5-7a83-4da8" name="Slaanesh" hidden="false"/>
    <categoryEntry id="ed0d-8e2a-225c-2340" name="Nurgle" hidden="false"/>
    <categoryEntry id="4bd-5ee0-f179-2fc5" name="Khorne" hidden="false"/>
    <categoryEntry id="b188-114f-6ba5-79a1" name="Tzeentch" hidden="false"/>
    <categoryEntry id="6e7-40c-58d9-e402" name="Faction: Adeptus Astartes" hidden="false"/>
    <categoryEntry id="5418-f86b-6e76-c5a" name="Faction: Adeptus Mechanicus" hidden="false">
      <modifiers>
        <modifier type="set" value="250" field="dee8-c245-3c3c-86b6" id="5155-3d32-76df-053b">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="500" field="dee8-c245-3c3c-86b6" id="2f2a-1769-3b72-b003">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="750" field="dee8-c245-3c3c-86b6" id="464a-d2f8-101b-1fab">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="25dd-7aa0-6bf4-f2d5" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="force" shared="true" id="dee8-c245-3c3c-86b6" includeChildSelections="true" includeChildForces="true" negative="false"/>
      </constraints>
    </categoryEntry>
    <categoryEntry id="226b-cf1e-353a-ae7f" name="Faction: Genestealer Cults" hidden="false"/>
    <categoryEntry id="bd1d-c1a5-6ca2-c791" name="Faction: World Eaters" hidden="false"/>
    <categoryEntry id="8474-765-16a9-f00d" name="Faction: Leagues of Votann" hidden="false"/>
    <categoryEntry id="9888-ddb2-a141-6037" name="Faction: Death Guard" hidden="false"/>
    <categoryEntry id="3d58-2655-391e-ecc" name="Faction: T&apos;au Empire" hidden="false"/>
    <categoryEntry id="eea5-aeaf-bbf0-d5ee" name="Faction: Adeptus Custodes" hidden="false"/>
    <categoryEntry id="56cc-5f43-2403-8da0" name="Faction: Orks" hidden="false"/>
    <categoryEntry id="7002-1fbb-7571-e8e7" name="Faction: Thousand Sons" hidden="false"/>
    <categoryEntry id="d564-3284-bf44-b873" name="Faction: Grey Knights" hidden="false"/>
    <categoryEntry id="5128-90b-e4a5-dcbd" name="Faction: Agents of the Imperium" hidden="false"/>
    <categoryEntry id="aab1-4f05-fabe-5ba5" name="Faction: Dark Angels" hidden="false"/>
    <categoryEntry id="65e4-13-4fa8-b36c" name="Faction: Salamanders" hidden="false"/>
    <categoryEntry id="d39c-9989-db7f-d815" name="Faction: Deathwatch" hidden="false"/>
    <categoryEntry id="62ac-ef42-27b4-ae7" name="Faction: Blood Angels" hidden="false"/>
    <categoryEntry id="1a2d-2f00-c054-4dcb" name="Faction: Ultramarines" hidden="false"/>
    <categoryEntry id="a0d9-c115-2a-8330" name="Faction: Space Wolves" hidden="false"/>
    <categoryEntry id="9249-acae-2882-d95" name="Faction: Black Templars" hidden="false"/>
    <categoryEntry id="84b7-7194-3b84-1b0c" name="Faction: Raven Guard" hidden="false"/>
    <categoryEntry id="b88e-1b0c-b79f-5cdf" name="Faction: Iron Hands" hidden="false"/>
    <categoryEntry id="97aa-d0e4-71c7-96c3" name="Faction: Imperial Fists" hidden="false"/>
    <categoryEntry id="5c0e-2250-dd3a-1df9" name="Faction: White Scars" hidden="false"/>
    <categoryEntry id="5c0e-4c31-d51b-e470" name="Warlord" hidden="false">
      <constraints>
        <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="false" id="16ac-a6c9-6d9a-d6d5" type="min"/>
        <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="false" id="3d50-6d29-4f91-8f73" type="max"/>
      </constraints>
    </categoryEntry>
    <categoryEntry id="9c0e-7e25-4580-e439" name="Daemon" hidden="false"/>
    <categoryEntry id="6474-0ce3-6b5a-120c" name="Primarch" hidden="false"/>
    <categoryEntry id="4f09-0141-6c70-6c5a" name="Daemon Prince" hidden="false"/>
    <categoryEntry id="b00b-5bae-444f-964e" name="Swarm" hidden="false"/>
    <categoryEntry id="2471-e2e0-3f55-d6cb" name="Drone" hidden="false"/>
    <categoryEntry id="7850-cc5a-c191-b80d" name="Great Devourer" hidden="false"/>
    <categoryEntry name="Retinue" hidden="false" id="cc77-a53-fca8-f48e"/>
    <categoryEntry name="Terminator" hidden="false" id="740a-892c-8958-defa"/>
    <categoryEntry name="Rhino" hidden="false" id="50a2-5557-84bb-ca4d"/>
    <categoryEntry id="dda2-bb0a-215e-ad9c" name="Jump Pack" hidden="false"/>
    <categoryEntry name="Armiger" id="4c40-ab9-54af-d290" hidden="false"/>
    <categoryEntry name="Questoris" id="e4d6-1a77-132b-f39d"/>
    <categoryEntry name="Dominus" id="af4c-b971-a31c-669c"/>
    <categoryEntry name="Allied Units" hidden="false" id="887b-ab87-92a2-20f5">
      <modifiers>
        <modifier type="set" value="500" field="4d8f-6e09-606e-788e" id="4ff4-f313-206c-fcb0">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1000" field="4d8f-6e09-606e-788e" id="934b-e7e4-b560-2d8c">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1500" field="4d8f-6e09-606e-788e" id="d1e5-86a2-d34b-13b3">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="greaterThan" value="0" field="selections" scope="force" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="roster" shared="true" id="4d8f-6e09-606e-788e" includeChildSelections="true" includeChildForces="true" negative="false"/>
      </constraints>
    </categoryEntry>
    <categoryEntry name="Acastus" hidden="false" id="f76f-29c1-de9-74c2"/>
    <categoryEntry name="Cerastus" hidden="false" id="481c-3b2e-5c99-c248"/>
    <categoryEntry name="Artillery" hidden="false" id="8cab-448d-37b7-32bc"/>
    <categoryEntry name="Order of Battle" id="ac7e-be7b-eb02-4752" hidden="false"/>
    <categoryEntry name="Faction: Harlequins" id="a5a2-d0c0-0349-d226" hidden="false"/>
    <categoryEntry name="Faction: Ynnari" id="9a21-190a-9d31-35d2" hidden="false"/>
    <categoryEntry name="Tyrannic War Veteran" id="26fe-d7cb-eb8f-77d4" hidden="false">
      <comment>Crusade content</comment>
    </categoryEntry>
    <categoryEntry name="Striding Behemoths" id="0dce-ed3d-83af-2f27" hidden="false">
      <comment>Crusade content</comment>
    </categoryEntry>
    <categoryEntry name="Monster Hunters" id="1532-9501-d870-4514" hidden="false">
      <comment>Crusade content</comment>
    </categoryEntry>
    <categoryEntry name="Psychic Weapon" id="4546-4a0c-b3be-e84c" hidden="true"/>
    <categoryEntry name="Extra Attacks Weapon" id="84c4-6d1e-e724-bd6e" hidden="true"/>
    <categoryEntry name="Torrent Weapon" id="064a-0470-60eb-e3ef" hidden="true"/>
    <categoryEntry name="Ranged Weapon" id="eeda-8544-a2f3-3fab" hidden="true">
      <comment>Used for Enhancement / Crusade Relic upgrades</comment>
    </categoryEntry>
    <categoryEntry name="Melee Weapon" id="ccdd-3987-11ed-90cd" hidden="true">
      <comment>Used for Enhancement / Crusade Relic upgrades</comment>
    </categoryEntry>
    <categoryEntry name="Crusade Relic" id="c13c-1717-f8a8-a8df" hidden="true">
      <comment>Category to be used to ignore characteristic changes by other upgrades</comment>
    </categoryEntry>
    <categoryEntry name="Pistol Weapon" id="1db0-c6b5-19db-8d0c" hidden="true"/>
    <categoryEntry name="Death Company" id="7278-781b-ce6c-d23c" hidden="false"/>
    <categoryEntry name="Attacks Dx Weapon" id="e993-e086-6de1-12af" hidden="true">
      <comment>Weapons that have D3/D6 but no &quot;+x&quot; in their Attacks characteristic - used for logic calculations</comment>
    </categoryEntry>
    <categoryEntry name="Damage Dx Weapon" id="4986-bf86-beb4-13ac" hidden="true">
      <comment>Weapons that have D3/D6 but no &quot;+x&quot; in their Damage characteristic - used for logic calculations</comment>
    </categoryEntry>
    <categoryEntry name="Attacks Dx+0 Modifier" id="6337-b83b-0d1e-5770" hidden="true">
      <comment>Flags a weapon that has had a +0 added to a D3/D6 Attacks characteristic - used for logic calculations</comment>
    </categoryEntry>
    <categoryEntry name="Damage Dx+0 Modifier" id="982b-de77-dd2d-d9bd" hidden="true">
      <comment>Flags a weapon that has had a +0 added to a D3/D6 Damage characteristic - used for logic calculations</comment>
    </categoryEntry>
    <categoryEntry id="59a9-b5cc-7c11-aaad" name="Tech-Priest" hidden="false"/>
    <categoryEntry name="Ministorum Priest" hidden="false" id="cc88-9467-86ac-4ca2">
      <constraints>
        <constraint type="max" value="3" field="selections" scope="roster" shared="true" id="9ad1-8aef-0d46-3b1b" includeChildSelections="true"/>
      </constraints>
    </categoryEntry>
    <categoryEntry name="Sanctifiers" id="9d4f-4beb-107d-3175" hidden="false">
      <constraints>
        <constraint type="max" value="3" field="selections" scope="roster" shared="true" id="3b97-07bb-1241-9cc6" includeChildSelections="true"/>
      </constraints>
    </categoryEntry>
    <categoryEntry name="Pilot" id="5b15-724e-2eeb-8cb7" hidden="false">
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="upgrade" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </categoryEntry>
    <categoryEntry name="Assault Weapon" id="e106-0758-7137-2432" hidden="true"/>
  </categoryEntries>
  <forceEntries>
    <forceEntry id="bb9d-299a-ed60-2d8a" name="Army Roster" hidden="false">
      <categoryLinks>
        <categoryLink id="d5de-ee57-ad4b-e4b7" name="Configuration" hidden="false" targetId="4ac9-fd30-1e3d-b249" primary="false"/>
        <categoryLink id="16fc-8e39-ee82-cf96" name="Epic Hero" hidden="false" targetId="4f3a-f0f7-6647-348d" primary="false"/>
        <categoryLink id="c932-1176-dc9-b390" name="Character" hidden="false" targetId="9cfd-1c32-585f-7d5c" primary="false">
          <constraints>
            <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="true" id="f08b-2179-601f-9af" type="min"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="0" field="f08b-2179-601f-9af">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="bdc0-c0d-72d7-87e2" shared="true" id="1fe4-8f37-4c24-271"/>
                    <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="880c-c7e-4a43-a0c1" shared="true" id="f16a-b2cd-1da5-4050"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </categoryLink>
        <categoryLink id="b3ba-1e1a-a92d-60d2" name="Battleline" hidden="false" targetId="e338-111e-d0c6-b687" primary="false"/>
        <categoryLink id="6d77-b79d-3ccb-6bf6" name="Infantry" hidden="false" targetId="cf47-a0d7-7207-29dc" primary="false"/>
        <categoryLink id="f5d5-b603-69b3-411c" name="Swarm" hidden="false" targetId="b00b-5bae-444f-964e" primary="false"/>
        <categoryLink id="6503-057c-cb62-badb" name="Mounted" hidden="false" targetId="14a0-40c9-2748-ae6e" primary="false"/>
        <categoryLink id="87ea-37d2-7b40-c708" name="Beast" hidden="false" targetId="4c3e-9310-a516-3590" primary="false"/>
        <categoryLink id="8e39-465e-7cfc-3085" name="Monster" hidden="false" targetId="9693-cf84-fe69-37a9" primary="false"/>
        <categoryLink id="2c76-65c5-bad0-8208" name="Vehicle" hidden="false" targetId="dbd4-63-af05-998" primary="false"/>
        <categoryLink id="8243-857b-2133-8887" name="Drone" hidden="false" targetId="2471-e2e0-3f55-d6cb" primary="false"/>
        <categoryLink id="cf3e-2c24-fe34-39f9" name="Dedicated Transport" hidden="false" targetId="ba07-411c-2832-1f79" primary="false"/>
        <categoryLink id="9198-c35d-71cd-eea3" name="Fortification" hidden="false" targetId="19d7-9c74-2140-5851" primary="false"/>
        <categoryLink id="a41a-6330-4718-d8d2" name="Unit" hidden="false" targetId="1160-70ae-a862-b1a8" primary="false"/>
        <categoryLink name="Allied Units" hidden="false" id="8d39-1cfc-6e44-2dae" targetId="887b-ab87-92a2-20f5"/>
      </categoryLinks>
    </forceEntry>
    <forceEntry name="Boarding Actions" hidden="true" id="1d6e-2579-8e7f-1ed4">
      <categoryLinks>
        <categoryLink id="4f79-1f3a-7f95-ae21" name="Configuration" hidden="false" targetId="4ac9-fd30-1e3d-b249" primary="false"/>
        <categoryLink id="73b6-764d-b0ab-977c" name="Epic Hero" hidden="false" targetId="4f3a-f0f7-6647-348d" primary="false"/>
        <categoryLink id="95ea-911f-b9a5-2d3e" name="Character" hidden="false" targetId="9cfd-1c32-585f-7d5c" primary="false">
          <constraints>
            <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="true" id="f08b-2179-601f-9af" type="min"/>
          </constraints>
        </categoryLink>
        <categoryLink id="57d9-fc38-a603-fdd2" name="Battleline" hidden="false" targetId="e338-111e-d0c6-b687" primary="false"/>
        <categoryLink id="ee07-d0f5-deb6-b64c" name="Infantry" hidden="false" targetId="cf47-a0d7-7207-29dc" primary="false"/>
        <categoryLink id="6d07-c461-1f18-a3eb" name="Swarm" hidden="false" targetId="b00b-5bae-444f-964e" primary="false"/>
        <categoryLink id="d9fd-28fe-bd15-d67e" name="Mounted" hidden="false" targetId="14a0-40c9-2748-ae6e" primary="false"/>
        <categoryLink id="9835-544c-d9d1-72bf" name="Beast" hidden="false" targetId="4c3e-9310-a516-3590" primary="false"/>
        <categoryLink id="bc76-9342-c298-99c9" name="Monster" hidden="false" targetId="9693-cf84-fe69-37a9" primary="false"/>
        <categoryLink id="61bf-bd6b-cba7-70b2" name="Vehicle" hidden="false" targetId="dbd4-63-af05-998" primary="false"/>
        <categoryLink id="5db7-9406-f21f-2de0" name="Drone" hidden="false" targetId="2471-e2e0-3f55-d6cb" primary="false"/>
        <categoryLink id="fe2b-ae0-8572-b6ff" name="Dedicated Transport" hidden="false" targetId="ba07-411c-2832-1f79" primary="false"/>
        <categoryLink name="Retinue" hidden="false" id="d932-86b9-29ec-c799" targetId="cc77-a53-fca8-f48e"/>
        <categoryLink name="Allied Units" hidden="false" id="ea52-2956-b106-5ec2" targetId="887b-ab87-92a2-20f5"/>
      </categoryLinks>
    </forceEntry>
    <forceEntry name="Crusade Force" id="cac3-71d1-ea4b-795d" hidden="false" exportable="false">
      <forceEntries>
        <forceEntry name="Crusade Army" id="ff7b-8f73-1756-650a" hidden="false">
          <categoryLinks>
            <categoryLink name="Configuration" hidden="false" id="c078-56fb-a0e9-fa0d" targetId="4ac9-fd30-1e3d-b249"/>
          </categoryLinks>
          <modifiers>
            <modifier type="set" value="1000" field="57b7-ac0e-5d06-9ddb">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="roster" childId="d62d-db22-4893-4bc0" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="2000" field="57b7-ac0e-5d06-9ddb">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="roster" childId="baf8-997f-e323-a090" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="3000" field="57b7-ac0e-5d06-9ddb">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="roster" childId="4204-82d0-908c-a62a" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="1" field="21dc-d454-3048-5aeb">
              <conditions>
                <condition type="atLeast" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="min" value="0" field="forces" scope="roster" shared="true" id="21dc-d454-3048-5aeb" includeChildSelections="true" includeChildForces="true"/>
            <constraint type="max" value="1" field="forces" scope="roster" shared="true" id="97cd-724b-362c-071d" includeChildSelections="true" includeChildForces="true"/>
            <constraint type="max" value="0" field="51b2-306e-1021-d207" scope="force" shared="true" id="57b7-ac0e-5d06-9ddb" includeChildSelections="true"/>
          </constraints>
        </forceEntry>
      </forceEntries>
      <categoryLinks>
        <categoryLink name="Order of Battle" hidden="false" id="2452-ede7-7eb6-add4" targetId="ac7e-be7b-eb02-4752"/>
        <categoryLink name="Configuration" hidden="false" id="a290-a601-b0c5-3ba1" targetId="4ac9-fd30-1e3d-b249"/>
        <categoryLink name="Epic Hero" hidden="false" id="50c3-798d-734d-6d5f" targetId="4f3a-f0f7-6647-348d" primary="false"/>
        <categoryLink name="Character" hidden="false" id="5fa8-178e-cb6c-4669" targetId="9cfd-1c32-585f-7d5c" primary="false">
          <constraints>
            <constraint type="min" value="1" field="selections" scope="roster" shared="true" id="771b-70a4-6eca-ca13" percentValue="false" includeChildSelections="true" includeChildForces="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="0" field="771b-70a4-6eca-ca13">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="bdc0-c0d-72d7-87e2" shared="true" id="6850-9e2d-ee40-9fdb"/>
                    <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="880c-c7e-4a43-a0c1" shared="true" id="ebb2-e80e-a08a-e168"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </categoryLink>
        <categoryLink name="Battleline" hidden="false" id="ceb5-d65a-179b-cfdd" targetId="e338-111e-d0c6-b687" primary="false"/>
        <categoryLink name="Infantry" hidden="false" id="9447-a1b3-41e2-8e71" targetId="cf47-a0d7-7207-29dc" primary="false"/>
        <categoryLink name="Swarm" hidden="false" id="a8d2-e42d-2d2d-5b61" targetId="b00b-5bae-444f-964e" primary="false"/>
        <categoryLink name="Mounted" hidden="false" id="2252-2bf7-54da-f3e3" targetId="14a0-40c9-2748-ae6e" primary="false"/>
        <categoryLink name="Beast" hidden="false" id="c56a-baf2-b6e3-dc10" targetId="4c3e-9310-a516-3590" primary="false"/>
        <categoryLink name="Monster" hidden="false" id="8eef-7007-d7a2-a968" targetId="9693-cf84-fe69-37a9" primary="false"/>
        <categoryLink name="Vehicle" hidden="false" id="f68a-2d0c-fd7b-9460" targetId="dbd4-63-af05-998" primary="false"/>
        <categoryLink name="Drone" hidden="false" id="1285-e936-26c8-b9bd" targetId="2471-e2e0-3f55-d6cb" primary="false"/>
        <categoryLink name="Dedicated Transport" hidden="false" id="8ef9-4038-9434-2ed0" targetId="ba07-411c-2832-1f79" primary="false"/>
        <categoryLink name="Fortification" hidden="false" id="9521-ccd2-1cb5-eef5" targetId="19d7-9c74-2140-5851" primary="false"/>
        <categoryLink name="Unit" hidden="false" id="4657-058c-657b-3d14" targetId="1160-70ae-a862-b1a8" primary="false"/>
        <categoryLink name="Pilot" hidden="false" id="3577-efe1-f844-d1e0" targetId="5b15-724e-2eeb-8cb7"/>
        <categoryLink name="Allied Units" hidden="false" id="8d77-c7df-e1a3-0680" targetId="887b-ab87-92a2-20f5"/>
      </categoryLinks>
      <modifiers>
        <modifier type="increment" value="1" field="215f-8816-ff04-d1ef">
          <repeats>
            <repeat value="1" repeats="1" field="selections" scope="force" childId="4213-a51d-bffe-87dc" shared="true" roundUp="false" includeChildSelections="true" includeChildForces="true"/>
          </repeats>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="0" field="51b2-306e-1021-d207" scope="force" shared="true" id="215f-8816-ff04-d1ef" includeChildSelections="true" includeChildForces="true"/>
      </constraints>
    </forceEntry>
  </forceEntries>
  <entryLinks>
    <entryLink id="7380-3e40-6ed6-b7cc" name="Battle Size" hidden="false" collective="false" import="true" targetId="564e-fbc6-5266-3ea4" type="selectionEntry"/>
  </entryLinks>
  <sharedSelectionEntries>
    <selectionEntry id="564e-fbc6-5266-3ea4" name="Battle Size" hidden="false" collective="false" import="true" type="upgrade">
      <constraints>
        <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="true" id="d907-5a90-75f2-feec" type="max"/>
        <constraint field="selections" scope="roster" value="1" percentValue="false" shared="true" includeChildSelections="true" includeChildForces="true" id="6b1c-4cb6-1e16-5ada" type="min"/>
      </constraints>
      <categoryLinks>
        <categoryLink id="bc21-bf76-b29d-576c" name="Configuration" hidden="false" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
      </categoryLinks>
      <selectionEntryGroups>
        <selectionEntryGroup id="b960-4789-a3a6-59cb" name="Battle Size" hidden="false" collective="false" import="true" defaultSelectionEntryId="none">
          <constraints>
            <constraint field="selections" scope="parent" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="132a-318-b78a-7afb" type="min"/>
            <constraint field="selections" scope="parent" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="dea4-90c8-6d86-3a01" type="max"/>
          </constraints>
          <selectionEntries>
            <selectionEntry id="d62d-db22-4893-4bc0" name="1. Incursion (1000 Point limit)" hidden="false" collective="false" import="true" type="upgrade">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry id="baf8-997f-e323-a090" name="2. Strike Force (2000 Point limit)" hidden="false" collective="false" import="true" type="upgrade">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry id="4204-82d0-908c-a62a" name="3. Onslaught (3000 Point limit)" hidden="false" collective="false" import="true" type="upgrade">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
              </costs>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Boarding Actions" id="30b5-5345-e180-13af" hidden="false">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Standard Boarding Patrol" hidden="false" id="21b-48a5-24c-152c" sortIndex="1"/>
            <selectionEntry type="upgrade" import="true" name="Narrative Mission: Seize the Engine Dock (Defender)" hidden="false" id="227e-45aa-4d8b-4171"/>
            <selectionEntry type="upgrade" import="true" name="Narrative Mission: Macro-junction IV-B" hidden="false" id="6d4e-233a-387d-6fc9"/>
            <selectionEntry type="upgrade" import="true" name="Breaching Operation Mission" hidden="false" id="f3ef-6eb6-31d1-8d0d"/>
          </selectionEntries>
          <constraints>
            <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="4d79-cd5a-699f-7813" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="258c-a3b8-c0b0-d9af" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
          </constraints>
        </selectionEntryGroup>
      </selectionEntryGroups>
      <costs>
        <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
      </costs>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true"/>
          </conditions>
        </modifier>
        <modifier type="set" value="Mission Ruleset" field="name">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Legends" hidden="false" id="9ed-cbf4-bfe5-90bf" defaultAmount="1">
      <categoryLinks>
        <categoryLink targetId="4ac9-fd30-1e3d-b249" id="8f35-ad49-afb5-715" primary="true" name="Configuration"/>
      </categoryLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1f32-5aaa-603e-fed1"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="Legends are visible" field="name">
          <conditions>
            <condition type="atLeast" value="1" field="selections" scope="parent" childId="9ed-cbf4-bfe5-90bf" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Unaligned Forces" hidden="false" id="2973-ea51-7f8d-5403">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ed3f-a6a6-a555-2a07"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="Unaligned Forces are visible" field="name">
          <conditions>
            <condition type="atLeast" value="1" field="selections" scope="parent" childId="2973-ea51-7f8d-5403" shared="true"/>
          </conditions>
        </modifier>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true" includeChildForces="false"/>
          </conditions>
        </modifier>
        <modifier type="set" value="1" field="defaultAmount">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Unaligned Fortifications" hidden="false" id="e916-2cf4-a49d-b8c4">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="355a-61e4-abb8-b97b"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="Unaligned Fortifications are visible" field="name">
          <conditions>
            <condition type="atLeast" value="1" field="selections" scope="parent" childId="e916-2cf4-a49d-b8c4" shared="true"/>
          </conditions>
        </modifier>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true" includeChildForces="false"/>
          </conditions>
        </modifier>
        <modifier type="set" value="1" field="defaultAmount">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show/Hide Options" hidden="false" id="e8ef-836a-a9d1-901d">
      <entryLinks>
        <entryLink import="true" name="Show Legends" hidden="false" type="selectionEntry" id="892f-57ca-d650-7199" targetId="9ed-cbf4-bfe5-90bf"/>
        <entryLink import="true" name="Show Unaligned Forces" hidden="false" type="selectionEntry" id="985-e753-2e94-859" targetId="2973-ea51-7f8d-5403"/>
        <entryLink import="true" name="Show Unaligned Fortifications" hidden="false" type="selectionEntry" id="4d37-22c-a45c-64f8" targetId="e916-2cf4-a49d-b8c4"/>
      </entryLinks>
      <constraints>
        <constraint field="selections" scope="force" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="7478-2e95-2444-b500" type="min"/>
      </constraints>
      <modifiers>
        <modifier type="set" field="7478-2e95-2444-b500" value="0"/>
        <modifier type="set-primary" value="4ac9-fd30-1e3d-b249" field="category"/>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true"/>
                <condition type="atLeast" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <selectionEntryGroups>
        <selectionEntryGroup name="Crusade Options" id="e7cc-312b-6c80-450d" hidden="false">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Show Nachmund Gauntlet content" hidden="false" id="c9b3-8039-f1e9-c975">
              <categoryLinks>
                <categoryLink name="Configuration" hidden="false" id="4650-5005-ee33-9136" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
              </categoryLinks>
              <constraints>
                <constraint type="min" value="1" field="selections" scope="force" shared="true" id="64f8-b8da-3c1b-6cf6" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="7e1a-3e2f-d5cc-ddaa"/>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3afb-a4a6-df71-c656"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="0" field="64f8-b8da-3c1b-6cf6"/>
                <modifier type="set" value="0" field="7e1a-3e2f-d5cc-ddaa"/>
                <modifier type="set" value="Nachmund Gauntlet content is enabled" field="name"/>
              </modifiers>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Show Pariah Nexus content" hidden="false" id="41bc-337c-cae2-eb21">
              <categoryLinks>
                <categoryLink name="Configuration" hidden="false" id="83e3-b7a8-b906-91b8" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
              </categoryLinks>
              <constraints>
                <constraint type="min" value="1" field="selections" scope="force" shared="true" id="f6b6-2c31-2873-5b81" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="c705-cac0-b570-bffd"/>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9e7f-6333-8785-c524"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="0" field="f6b6-2c31-2873-5b81"/>
                <modifier type="set" value="0" field="c705-cac0-b570-bffd"/>
                <modifier type="set" value="Pariah Nexus content is enabled" field="name"/>
              </modifiers>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Show Tyrannic War content" hidden="false" id="c566-c14f-c589-5375">
              <categoryLinks>
                <categoryLink name="Configuration" hidden="false" id="0d1d-84f9-e9fc-7564" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
              </categoryLinks>
              <constraints>
                <constraint type="min" value="1" field="selections" scope="force" shared="true" id="2173-f2a6-397c-8fbf" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="d147-319b-3d28-53cb"/>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="d6d9-d4e8-59d5-5a35"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="0" field="2173-f2a6-397c-8fbf"/>
                <modifier type="set" value="0" field="d147-319b-3d28-53cb"/>
                <modifier type="set" value="Tyrannic War content is enabled" field="name"/>
              </modifiers>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Show Armageddon content" hidden="false" id="5700-66f7-a020-7386">
              <categoryLinks>
                <categoryLink name="Configuration" hidden="false" id="ad09-2744-4123-e5e3" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
              </categoryLinks>
              <constraints>
                <constraint type="min" value="1" field="selections" scope="force" shared="true" id="44e6-438f-81a1-612e" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="396c-cc07-a31f-fc0c"/>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8aa0-b655-2f64-12c5"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="0" field="44e6-438f-81a1-612e"/>
                <modifier type="set" value="0" field="396c-cc07-a31f-fc0c"/>
                <modifier type="set" value="Armageddon content is enabled" field="name"/>
              </modifiers>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Show White Dwarf content" hidden="false" id="c00c-b9d6-e0f7-4c37">
              <categoryLinks>
                <categoryLink name="Configuration" hidden="false" id="f600-543f-cadc-0f0b" targetId="4ac9-fd30-1e3d-b249" primary="true"/>
              </categoryLinks>
              <constraints>
                <constraint type="min" value="1" field="selections" scope="force" shared="true" id="6b90-ed5c-2319-a854" percentValue="false" includeChildSelections="false" includeChildForces="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="4846-14da-105b-0ef6"/>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1d0f-fae4-fcdd-d2c7"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="0" field="6b90-ed5c-2319-a854"/>
                <modifier type="set" value="0" field="4846-14da-105b-0ef6"/>
                <modifier type="set" value="White Dwarf content is enabled" field="name"/>
              </modifiers>
            </selectionEntry>
          </selectionEntries>
        </selectionEntryGroup>
        <selectionEntryGroup name="Boarding Actions Options" id="bcb6-3ad0-ad8a-0c30" hidden="false" flatten="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Show Killzone Upgrade: Shadowvaults content" hidden="false" id="9869-d845-89a6-6273">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="64ec-d604-9232-79b4" includeChildSelections="false"/>
              </constraints>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Order of Battle" hidden="false" id="eda7-8b4b-3719-af36">
      <categoryLinks>
        <categoryLink name="Order of Battle" hidden="false" id="9cd2-0658-7168-7881" targetId="ac7e-be7b-eb02-4752" primary="true"/>
      </categoryLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="roster" shared="true" id="d59f-2804-3c43-6b7e" includeChildSelections="true"/>
        <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="b3a1-d8c7-6085-5d98" includeChildSelections="true"/>
      </constraints>
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Requisition Points" hidden="false" id="ce7f-9d46-52a9-947c" defaultAmount="5" sortIndex="3">
          <constraints>
            <constraint type="max" value="10" field="selections" scope="parent" shared="true" id="b320-bdb5-fe91-6078" includeChildSelections="false"/>
          </constraints>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Battle Tally" hidden="false" id="3dd5-2e5a-a042-6595" sortIndex="4"/>
        <selectionEntry type="upgrade" import="true" name="Victories" hidden="false" id="1d15-6e78-ba49-ace9" sortIndex="5"/>
        <selectionEntry type="upgrade" import="true" name="Supply Limit" hidden="false" id="4213-a51d-bffe-87dc" sortIndex="2">
          <constraints>
            <constraint type="min" value="1000" field="selections" scope="parent" shared="true" id="6be6-c41c-ea86-298a" includeChildSelections="false"/>
          </constraints>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Blackstone Fragments" hidden="false" id="da84-2394-ae2a-ed65" sortIndex="6">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="parent" childId="0e83-84fd-f2a7-223c" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntry>
      </selectionEntries>
      <modifiers>
        <modifier type="set" value="0" field="d59f-2804-3c43-6b7e">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="false" includeChildForces="false"/>
          </conditions>
        </modifier>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="false" includeChildForces="false"/>
          </conditions>
        </modifier>
      </modifiers>
      <comment>Crusade content</comment>
      <selectionEntryGroups>
        <selectionEntryGroup name="Current Campaign" id="41a3-8e07-1e16-db1d" hidden="false" sortIndex="1" defaultSelectionEntryId="none" collapsible="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Tyrannic War" hidden="false" id="11ab-9c3e-c756-9602" sortIndex="5"/>
            <selectionEntry type="upgrade" import="true" name="Nachmund Gauntlet" hidden="false" id="a1e8-4bda-9200-f7c7" sortIndex="3"/>
            <selectionEntry type="upgrade" import="true" name="Armageddon" hidden="false" id="fd80-17e3-3c1a-6570" sortIndex="2"/>
            <selectionEntry type="upgrade" import="true" name="Pariah Nexus" hidden="false" id="0e83-84fd-f2a7-223c" sortIndex="4"/>
            <selectionEntry type="upgrade" import="true" name="No GW Campaign" hidden="false" id="bce6-d51c-3e40-4fcd" sortIndex="1"/>
          </selectionEntries>
          <constraints>
            <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="1c60-f014-b8f0-6eae-min" includeChildSelections="false"/>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1c60-f014-b8f0-6eae-max" includeChildSelections="false"/>
          </constraints>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Experience Points" hidden="false" id="2dbf-4d49-5d74-85c9">
      <constraints>
        <constraint type="max" value="30" field="selections" scope="parent" shared="true" id="466f-ffd6-0947-139b" includeChildSelections="false"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="-1" field="466f-ffd6-0947-139b">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                <condition type="atLeast" value="1" field="selections" scope="parent" childId="1511-18fe-f51e-7b9d" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <costs>
        <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
        <cost name="Crusade: Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
        <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
        <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="1"/>
      </costs>
      <comment>Crusade content</comment>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Legendary Veterans" hidden="false" id="1511-18fe-f51e-7b9d">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1ae8-a0c8-eb1c-8318" includeChildSelections="false"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <comment>Crusade content</comment>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Weapon Modifications" hidden="false" id="d1a5-4297-168b-11cd">
      <constraints>
        <constraint type="max" value="3" field="selections" scope="parent" shared="true" id="4a83-fc07-f67a-f3ab" includeChildSelections="false"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="6" field="4a83-fc07-f67a-f3ab">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true"/>
                <condition type="atLeast" value="1" field="selections" scope="parent" childId="1511-18fe-f51e-7b9d" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="2" field="b03b-c239-15a5-da55">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <costs>
        <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
        <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
        <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
        <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
        <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
      </costs>
      <comment>Crusade content</comment>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Totemic Presence upgrade" hidden="false" id="6220-fe17-7c2a-8268">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="unit" shared="true" id="8199-2676-9f51-f430" includeChildSelections="false"/>
      </constraints>
      <comment>Pariah Nexus Crusade content</comment>
      <modifierGroups>
        <modifierGroup type="and">
          <modifiers>
            <modifier type="append" value="Totemic Presence" field="annotation" join=", " scope="model" affects="self.entries.profiles.Unit"/>
            <modifier type="increment" value="2" field="bef7-942a-1a23-59f8" scope="model" affects="self.entries.profiles.Unit" join=", "/>
          </modifiers>
        </modifierGroup>
      </modifierGroups>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="unit" childId="986e-4f03-db70-9bd3" shared="true" includeChildSelections="true"/>
              </conditions>
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="unit" childId="6220-fe17-7c2a-8268" shared="true" includeChildSelections="true"/>
                    <condition type="lessThan" value="1" field="selections" scope="model" childId="6220-fe17-7c2a-8268" shared="true" includeChildSelections="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Damned Souls" hidden="false" id="e66d-3831-dd6d-5f88">
      <comment>Blood Angels Crusade content</comment>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="7278-781b-ce6c-d23c" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="977c-2d1e-aa65-6364" includeChildSelections="false"/>
      </constraints>
    </selectionEntry>
  </sharedSelectionEntries>
  <sharedRules>
    <rule id="8bf7-8812-923d-29e4" name="Pistol" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[PISTOL]** in their profile are known as Pistols. If a unit contains any models equipped with Pistols, that unit is eligible to shoot in its controlling player’s Shooting phase even while it is within Engagement Range of one or more enemy units. When such a unit is selected to shoot, it can only resolve attacks using its Pistols and can only target one of the enemy units it is within Engagement Range of. In such circumstances, a Pistol can target an enemy unit even if other friendly units are within Engagement Range of the same enemy unit. 

If a model is equipped with one or more Pistols, unless it is a **^^Monster^^** or **^^Vehicle^^** model, it can either shoot with its Pistols or with all of its other ranged weapons. Declare whether such a model will shoot with its Pistols or its other ranged weapons before selecting targets.</description>
      <alias>PISTOL</alias>
    </rule>
    <rule id="8367-374c-f87-c627" name="Hazardous" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with **[HAZARDOUS]** in their profile are known as Hazardous weapons. Each time a unit is selected to shoot or fight, after that unit has resolved all of its attacks, for each Hazardous weapon that targets were selected for when resolving those attacks, that unit must take one Hazardous test. To do so, roll one D6: on a 1, that test is failed. For each failed test you must resolve the following sequence (resolve each failed test one at a time): 

■ If possible, select one model in that unit that has lost one or more wounds and is equipped with one or more Hazardous weapons. 
■ Otherwise, if possible, select one model in that unit (excluding **^^Character^^** models) equipped with one or more Hazardous weapons. 
■ Otherwise, select one **^^Character^^** model in that unit equipped with one or more Hazardous weapons. 

If a model was selected, that unit suffers 3 mortal wounds and when allocating those mortal wounds, they must be allocated to the selected model. 

If a unit from a player’s army is selected as the target of the Fire Overwatch Stratagem in their opponent’s Charge phase, any mortal wounds inflicted by Hazardous tests are allocated after the charging unit has ended its Charge move.</description>
      <alias>HAZARDOUS</alias>
    </rule>
    <rule id="b4dd-3e1f-41cb-218f" name="Leader" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>While a Bodyguard unit contains a Leader, it is known as an Attached unit and, with the exception of rules that are triggered when units are destroyed (pg 12), it is treated as a single unit for all rules purposes. Each time an attack targets an Attached unit, until the attacking unit has resolved all of its attacks, you must use the Toughness characteristic of the Bodyguard models in that unit, even if a Leader in that unit has a different Toughness characteristic. Each time an attack successfully wounds an Attached unit, that attack cannot be allocated to a Character model in that unit, even if that Character model has lost one or more wounds or has already had attacks allocated to it this phase. As soon as the last Bodyguard model in an Attached unit has been destroyed, any attacks made against that unit that have yet to be allocated can then be allocated to Character models in that unit.

Each time the last model in a Bodyguard unit is destroyed, each CHARACTER unit that is part of that Attached unit becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks. 

Each time the last model in a CHARACTER unit that is attached to a Bodyguard unit is destroyed and there is not another CHARACTER unit attached, that Attached unit’s Bodyguard unit becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks. 

Each time a unit that is part of an Attached unit is destroyed, it does not have the keywords of any other units that make up that Attached unit (unless it has those keywords on its own datasheet) for the purposes of any rules that would be triggered when that unit is destroyed.</description>
    </rule>
    <rule id="be1e-ac8e-1e2c-3528" name="Devastating Wounds" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with **[DEVASTATING WOUNDS]** in their profile are known as Devastating Wounds weapons. Each time an attack is made with such a weapon, if that attack scores a Critical Wound, no saving throw of any kind can be made against that attack (including invulnerable saving throws). Such attacks are only allocated to models after all other attacks made by the attacking unit have been allocated and resolved. After that attack is allocated and after any modifiers are applied, it inflicts a number of mortal wounds on the target equal to the Damage characteristic of that attack, instead of inflicting damage normally.</description>
      <alias>DEVASTATING WOUNDS</alias>
    </rule>
    <rule id="fc8a-8c24-bae9-cc1c" name="Assault" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[ASSAULT]** in their profile are known as Assault weapons. If a unit that Advanced this turn contains any models equipped with Assault weapons, it is still eligible to shoot in this turn’s Shooting phase. When such a unit is selected to shoot, you can only resolve attacks using Assault weapons its models are equipped with.</description>
      <alias>ASSAULT</alias>
    </rule>
    <rule id="115b-79dc-f723-d761" name="Extra Attacks" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with **[EXTRA ATTACKS]** in their profile are known as Extra Attacks weapons. Each time the bearer of one or more Extra Attacks weapons fights, it makes attacks with each of the Extra Attacks melee weapons it is equipped with and it makes attacks with one of the melee weapons it is equipped with that does not have the [EXTRA ATTACKS] ability (if any). The number of attacks made with an Extra Attacks weapon cannot be modified by other rules, unless that weapon’s name is explicitly specified in that rule.</description>
      <alias>EXTRA ATTACKS</alias>
    </rule>
    <rule id="cf93-ad4d-2f08-a79d" name="Twin-linked" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[TWIN-LINKED]** in their profile are known as Twin-linked weapons. Each time an attack is made with such a weapon, you can re-roll that attack’s Wound roll.</description>
      <alias>TWIN-LINKED</alias>
    </rule>
    <rule id="4111-82e3-9444-e942" name="Anti-" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with **[ANTI-KEYWORD X+]** in their profile are known as Anti weapons. Each time an attack is made with such a weapon against a target with the keyword after the word ‘Anti-’, an unmodified Wound roll of ‘x+’ scores a Critical Wound.</description>
      <alias>ANTI-</alias>
    </rule>
    <rule id="1897-c22c-9597-12b1" name="Sustained Hits" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with **[SUSTAINED HITS X]** in their profile are known as Sustained Hits weapons. Each time an attack is made with such a weapon, if a Critical Hit is rolled, that attack scores a number of additional hits on the target as denoted by ‘x’</description>
      <alias>SUSTAINED HITS</alias>
    </rule>
    <rule id="1202-10a8-78e9-4c67" name="Heavy" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with **[HEAVY]** in their profile are known as Heavy weapons. Each time an attack is made with such a weapon, if the attacking model’s unit Remained Stationary this turn, add 1 to that attack’s Hit roll.</description>
      <alias>HEAVY</alias>
    </rule>
    <rule id="7cdb-fb99-44a9-8849" name="Melta" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with **[MELTA X]** in their profile are known as Melta weapons. Each time an attack made with such a weapon targets a unit within half that weapon’s range, that attack’s Damage characteristic is increased by the amount denoted by ‘x’.</description>
      <alias>MELTA</alias>
    </rule>
    <rule id="9bf4-280f-bbe2-6fbb" name="Feel No Pain" publicationId="48fc-15aa-b307-9443" page="23" hidden="false">
      <description>Some models have &apos;Feel No Pain x+&apos; listed in their abilities. Each time a model with this ability suffers damage and so would lose a wound (including wounds lost due to mortal wounds), roll one D6: if the result is greater than or equal to the number denoted by &apos;x: that wound is ignored and is not lost. If a model has more than one Feel No Pain ability, you can only use one of those abilities each time that model suffers damage and so would lose a wound.</description>
    </rule>
    <rule id="6c1f-1cf7-ff25-c99e" name="Blast" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with **[BLAST]** in their profile are known as Blast weapons, and they make a random number of attacks. Each time you determine how many attacks are made with a Blast weapon, add 1 to the result for every five models that were in the target unit when you selected it as the target (rounding down). Blast weapons can never be used to make attacks against a unit that is within Engagement Range of one or more units from the attacking model’s army (including its own unit).</description>
      <alias>BLAST</alias>
    </rule>
    <rule id="9143-31ae-e0a6-6007" name="Precision" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with **[PRECISION]** in their profile are known as Precision weapons. Each time an attack made with such a weapon successfully wounds an Attached unit, if a Character model in that unit is visible to the attacking model, the attacking model’s player can choose to have that attack allocated to that Character model instead of following the normal attack sequence.</description>
      <alias>PRECISION</alias>
    </rule>
    <rule id="4ddd-4e29-acdd-5e6d" name="Indirect Fire" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with **[INDIRECT FIRE]** in their profile are known as Indirect Fire weapons, and attacks can be made with them even if the target is not visible to the attacking model. These attacks can destroy enemy models in a target unit even though none may have been visible to the attacking unit when you selected that target.


If no models in a target unit are visible to the attacking unit when you select that target, then each time a model in the attacking unit makes an attack against that target using an Indirect Fire weapon, subtract 1 from that attack’s Hit roll, an unmodified Hit roll of 1-3 always fails, and the target has the Benefit of Cover against that attack. Weapons with the **[TORRENT]** ability cannot be fired using the **[INDIRECT FIRE]** ability.</description>
      <alias>INDIRECT FIRE</alias>
    </rule>
    <rule id="2ebc-abdf-8129-6c57" name="Lance" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[LANCE]** in their profile are known as Lance weapons. Each time an attack is made with such a weapon, if the bearer made a Charge move this turn, add 1 to that attack’s Wound roll.</description>
      <alias>LANCE</alias>
    </rule>
    <rule id="d1d1-611e-5191-1095" name="Lethal Hits" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[LETHAL HITS]** in their profile are known as Lethal Hits weapons. Each time an attack is made with such a weapon, a Critical Hit automatically wounds the target.</description>
      <alias>LETHAL HITS</alias>
    </rule>
    <rule id="4640-43e7-30b-215a" name="Ignores Cover" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[IGNORES COVER]** in their profile are known as Ignores Cover weapons. Each time an attack is made with such a weapon, the target cannot have the Benefit of Cover against that attack.</description>
      <alias>IGNORES COVER</alias>
    </rule>
    <rule id="c5c8-8b58-b8b6-7786" name="Rapid Fire" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[RAPID FIRE X]** in their profile are known as Rapid Fire weapons. Each time such a weapon targets a unit within half that weapon’s range, the Attacks characteristic of that weapon is increased by the amount denoted by ‘x’.</description>
      <alias>RAPID FIRE</alias>
    </rule>
    <rule id="5edf-d619-23e0-9b56" name="Torrent" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with **[TORRENT]** in their profile are known as Torrent weapons. Each time an attack is made with such a weapon, that attack automatically hits the target.</description>
      <alias>TORRENT</alias>
    </rule>
    <rule id="ada6-bac1-ffe0-d6f7" name="Scouts" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>Some units have ‘Scouts x&quot;’ listed in their abilities. If every model in a unit has this ability, then at the start of the first battle round, before the first turn begins, it can make a Normal move of up to x&quot;, with the exception that, while making that move, the distance moved by each model in that unit can be greater than that model&apos;s Move characteristic, as long as it is not greater than x&quot;. 

DEDICATED TRANSPORT models can make use of any Scouts x&quot; ability listed in their abilities, or a Scouts x&quot; ability that a unit that starts the battle embarked within that DEDICATED TRANSPORT  model has (provided only models with this ability are embarked within that Dedicated Transport model), regardless of how that embarked unit gained this ability (e.g. listed in their abilities, conferred by an Enhancement or by an attached Character, etc.). 

A unit that moves using this ability must end that move more than 9&quot; horizontally away from all enemy models. If both players have units that can do this, the player who is taking the first turn moves their units first.</description>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </rule>
    <rule id="c05d-f4c3-f091-4938" name="Infiltrators" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>During deployment, if every model in a unit has this ability, then when you set it up, it can be set up anywhere on the battlefield that is more than 9&quot; horizontally away from the enemy deployment zone and all enemy models.</description>
    </rule>
    <rule id="7cb5-dd6b-dd87-ad3b" name="Deep Strike" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>During the Declare Battle Formations step, if every model in a unit has this ability, you can set it up in Reserves instead of setting it up on the battlefield. If you do, in the Reinforcements step of one of your Movement phases you can set up this unit anywhere on the battlefield that is more than 9&quot; horizontally away from all enemy models.

If a unit with the Deep Strike ability arrives from Strategic Reserves, the controlling player can choose for that unit to be set up either using the rules for Strategic Reserves or using the Deep Strike ability.</description>
    </rule>
    <rule id="b68a-5ded-65ac-98c" name="Deadly Demise" publicationId="48fc-15aa-b307-9443" page="23" hidden="false">
      <description>Some models have &apos;Deadly Demise x&apos; listed in their abilities. When such a model is destroyed, roll one D6 before removing it from play (if such a model is a TRANSPORT, roll before any embarked models disembark). On a 6, each unit within 6&quot; of that model suffers a number of mortal wounds denoted by &apos;x&apos; (if this is a random number, roll separately for each unit within 6&quot;).</description>
    </rule>
    <rule id="bec5-4288-34a6-ccfa" name="Stealth" publicationId="48fc-15aa-b307-9443" page="20" hidden="false">
      <description>If every model in a unit has this ability, then each time a ranged attack is made against it, subtract 1 from that attack’s Hit roll.</description>
    </rule>
    <rule id="5e13-1624-d280-418d" name="Super-Heavy Walker" hidden="false">
      <description>Each time a model with this ability makes a Normal, Advance or Fall Back move, it can move through models (excluding **^^Titanic^^** models) and sections of terrain features that are 4&quot; or less in height.
When doing so:
- It can move within Engagement Range of enemy models, but cannot end that move within Engagement Range of them.
- It can also move through sections of terrain features that are more than 4&quot; in height, but if it does, after it has moved, roll one D6: on a 1, that model is Battle-shocked.</description>
    </rule>
    <rule id="a8a0-8fe7-898-e0f3" name="Lone Operative" publicationId="48fc-15aa-b307-9443" page="19" hidden="false">
      <description>Unless part of an Attached unit, this unit can only be selected as the target of a ranged attack if the attacking model is within 12&quot;.</description>
    </rule>
    <rule id="eec5-5f54-9c03-c305" name="Hover" publicationId="48fc-15aa-b307-9443" page="53" hidden="false">
      <description>Some **^^Aircraft^^** models have &apos;Hover&apos; listed in their abilities. When you are instructed to Declare Battle Formations, before doing anything else, you must first declare which models from your army with this ability will be in Hover mode.

If a model is in Hover mode, then until the end of the battle, its Move characteristic is changed to 20&quot;, it loses the **^^Aircraft^^** keyword and it loses all associated rules for being an **^^Aircraft^^** model. Models in Hover mode do not start the battle in Reserves, but you can choose to place them into Strategic Reserves following the normal rules if you wish.</description>
    </rule>
    <rule id="24-c886-e8ba-5a89" name="Fights First" publicationId="48fc-15aa-b307-9443" page="32" hidden="false">
      <description>Units with this ability that are eligible to fight do so in the Fights First step, provided every model in the unit has this ability.</description>
    </rule>
    <rule id="e9c4-2bb8-12ee-cd1b" name="Psychic" publicationId="48fc-15aa-b307-9443" page="38" hidden="false">
      <description>Some weapons and abilities can only be used by **^^Psykers^^**. Such weapons and abilities are tagged with the word &apos;Psychic&apos;. If a Psychic weapon or ability causes any unit to suffer one or more wounds, each of those wounds is considered to have been inflicted by a Psychic Attack.</description>
      <alias>PSYCHIC</alias>
    </rule>
    <rule id="13b2-6518-dab3-7ea1" name="Firing Deck" page="17" hidden="false">
      <description>Some **^^Transport^^** models have ‘Firing Deck x’ listed in their abilities. Each time such a model is selected to shoot in the Shooting phase, you can select up to ‘x’ models embarked within it whose units have not already shot this phase. Then, for each of those embarked models, you can select one ranged weapon that embarked model is equipped with (excluding weapons with the **[ONE SHOT]** ability). Until that **^^Transport^^** model has resolved all of its attacks, it counts as being equipped with all of the weapons you selected in this way, in addition to its other weapons. Until the end of the phase, those selected models’ units are not eligible to shoot.</description>
    </rule>
    <rule id="cd26-1611-860a-91e4" name="One Shot" hidden="false">
      <description>The bearer can only shoot with this weapon once per battle.</description>
      <alias>ONE SHOT</alias>
    </rule>
  </sharedRules>
  <sharedProfiles>
    <profile id="fa4e-5ac8-11a6-78d2" name="Fortification" hidden="false" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an enemy unit is only within Engagement Range of one or more ^^**Fortifications**^^ from your army:
- That unit can still be selected as the target of ranged attacks, but each time such an attack is made, unless it is made with a Pistol, subtract 1 from the Hit roll.
- Models in that unit do not need to take Desperate Escape tests due to Falling Back while Battle-shocked, except for those that will move over enemy models when doing so.</characteristic>
      </characteristics>
    </profile>
    <profile name="Lord of Deceit (Aura)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8332-466b-a51f-63ab">
      <characteristics>
        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time your opponent targets a unit from their army with a Stratagem, if that unit is within 12&quot; of this model, increase the cost of that use of that Stratagem by 1CP.</characteristic>
      </characteristics>
    </profile>
  </sharedProfiles>
  <sharedSelectionEntryGroups>
    <selectionEntryGroup name="Weapon Modifications" id="f9da-852a-d7f0-92e9" hidden="false">
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="lessThan" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="b678-4a99-210e-931f" shared="true" includeChildSelections="true"/>
                <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="true"/>
              </conditions>
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="any" shared="true" includeChildSelections="true"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="equalTo" value="6" field="75bb-ded1-c86d-bdf0" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="1511-18fe-f51e-7b9d" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="6" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="equalTo" value="3" field="75bb-ded1-c86d-bdf0" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="1511-18fe-f51e-7b9d" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="3" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="equalTo" value="6" field="75bb-ded1-c86d-bdf0" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="6" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="1" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="2" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="2" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="4" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="3" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="6" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="4" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="8" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="5" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="10" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="6" field="selections" scope="root-entry" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="12" field="selections" scope="root-entry" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="2" field="2a14-db5e-c5ad-5ae9">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="equalTo" value="1" field="selections" scope="self" childId="any" shared="true"/>
                <condition type="equalTo" value="0" field="selections" scope="self" childId="d327-a8ea-20de-37f4" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="1" field="2a14-db5e-c5ad-5ae9">
          <conditions>
            <condition type="equalTo" value="1" field="selections" scope="self" childId="d327-a8ea-20de-37f4" shared="true"/>
          </conditions>
        </modifier>
        <modifier type="set" value="1" field="b96f-03f7-d8a1-92ce">
          <conditions>
            <condition type="equalTo" value="1" field="selections" scope="self" childId="d327-a8ea-20de-37f4" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="2" field="selections" scope="self" shared="true" id="b96f-03f7-d8a1-92ce" includeChildSelections="false"/>
        <constraint type="min" value="0" field="selections" scope="self" shared="true" id="2a14-db5e-c5ad-5ae9"/>
      </constraints>
      <comment>Crusade content</comment>
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Armour Piercing (AP+1)" hidden="false" id="128d-c573-273f-47b5">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="113d-f8b1-7c83-8844" includeChildSelections="false"/>
          </constraints>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Armour Piercing</comment>
              <modifiers>
                <modifier type="append" value="Armour Piercing" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="decrement" value="1" field="9ead-8a10-520-de15" scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="append" value="Armour Piercing" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
                <modifier type="decrement" value="1" field="41a0-1301-112a-e2f2" scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Brutal (S+1)" hidden="false" id="c5fb-58f5-2d2f-cc09">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f0b9-cb53-9d50-446b" includeChildSelections="false"/>
          </constraints>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Brutal</comment>
              <modifiers>
                <modifier type="append" value="Brutal" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="increment" value="1" field="2229-f494-25db-c5d3" scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="increment" value="1" field="ab33-d393-96ce-ccba" scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
                <modifier type="append" value="Brutal" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Finely Balanced (BS/WS+1)" hidden="false" id="a925-2f50-1580-0f5c">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2e35-2606-32de-f70e" includeChildSelections="false"/>
          </constraints>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Finely Balanced</comment>
              <modifiers>
                <modifier type="append" value="Finely Balanced" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="decrement" value="1" field="94d-8a98-cf90-183e" scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
                <modifier type="decrement" value="1" field="95d1-95f-45b4-11d6" scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
                <modifier type="append" value="Finely Balanced" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
                <modifier type="floor" value="2" field="95d1-95f-45b4-11d6" scope="upgrade" affects="self.entries.profiles.Melee Weapons"/>
                <modifier type="floor" value="2" field="94d-8a98-cf90-183e" scope="upgrade" affects="self.entries.profiles.Ranged Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Heirloom (A+1)" hidden="false" id="2801-9f1c-645d-cb3d">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7351-cca3-269c-9d17" includeChildSelections="false"/>
          </constraints>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Heirloom</comment>
              <modifiers>
                <modifier type="append" value="Heirloom" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons"/>
                <modifier type="append" value="Heirloom" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" field="3bb-c35f-f54-fb08" scope="upgrade" affects="e993-e086-6de1-12af.profiles.Ranged Weapons" arg="+0" value="+0" join=""/>
                <modifier type="append" field="2337-daa1-6682-b110" scope="upgrade" affects="e993-e086-6de1-12af.profiles.Melee Weapons" arg="+0" value="+0" join=""/>
                <modifier type="replace" field="3bb-c35f-f54-fb08" scope="upgrade" affects="6337-b83b-0d1e-5770.profiles.Ranged Weapons" arg="+0"/>
                <modifier type="replace" field="2337-daa1-6682-b110" scope="upgrade" affects="6337-b83b-0d1e-5770.profiles.Melee Weapons" arg="+0"/>
                <modifier type="increment" value="1" field="3bb-c35f-f54-fb08" scope="upgrade" affects="profiles.Ranged Weapons" position="-1"/>
                <modifier type="increment" value="1" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" position="-1"/>
                <modifier type="replace" field="3bb-c35f-f54-fb08" scope="upgrade" affects="profiles.Ranged Weapons" arg="+0"/>
                <modifier type="replace" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" arg="+0"/>
                <modifier type="add" value="6337-b83b-0d1e-5770" field="category" scope="upgrade" arg="+0" affects="e993-e086-6de1-12af"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="84c4-6d1e-e724-bd6e" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Master-worked (D+1)" hidden="false" id="584b-5fa7-a3c3-942e">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a0b6-8226-f8e5-c390" includeChildSelections="false"/>
          </constraints>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Master-worked</comment>
              <modifiers>
                <modifier type="append" value="Master-worked" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons"/>
                <modifier type="append" value="Master-worked" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="4986-bf86-beb4-13ac.profiles.Ranged Weapons" join="" arg="+0" value="+0"/>
                <modifier type="append" field="3254-9fe6-d824-513e" scope="upgrade" affects="4986-bf86-beb4-13ac.profiles.Melee Weapons" join="" arg="+0" value="+0"/>
                <modifier type="replace" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="982b-de77-dd2d-d9bd.profiles.Ranged Weapons" join="" arg="+0"/>
                <modifier type="replace" field="3254-9fe6-d824-513e" scope="upgrade" affects="982b-de77-dd2d-d9bd.profiles.Melee Weapons" join="" arg="+0"/>
                <modifier type="increment" value="1" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="profiles.Ranged Weapons" position="-1"/>
                <modifier type="increment" value="1" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" position="-1"/>
                <modifier type="replace" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="profiles.Ranged Weapons" join="" arg="+0"/>
                <modifier type="replace" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" join="" arg="+0"/>
                <modifier type="add" value="982b-de77-dd2d-d9bd" field="category" scope="upgrade" join="" arg="+0" affects="4986-bf86-beb4-13ac"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Precise" hidden="false" id="56e5-82b6-8596-85f5">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="01a3-f7d7-2d1c-0425" includeChildSelections="false"/>
          </constraints>
          <profiles>
            <profile name="Precise" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="e257-ed3e-c157-a9c6">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a Critical Wound is scored for an attack made with this weapon, that attack has the **[PRECISION]** ability.</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <infoLinks>
            <infoLink name="Precision" id="e2aa-a903-21c9-9a9b" hidden="false" type="rule" targetId="9143-31ae-e0a6-6007"/>
          </infoLinks>
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Seeping Poisons" hidden="false" id="d327-a8ea-20de-37f4">
          <costs>
            <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
            <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
            <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
            <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
            <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="2"/>
          </costs>
          <infoLinks>
            <infoLink name="Lethal Hits" id="ea3c-d126-6581-9c0d" hidden="false" type="rule" targetId="d1d1-611e-5191-1095"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="045e-f0f0-0c25-9a3c" includeChildSelections="false"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="primary-catalogue" childId="5108-f98-63c2-53cb" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <comment>Master-worked</comment>
              <modifiers>
                <modifier type="append" value="Seeping Poisons" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons"/>
                <modifier type="append" value="Lethal Hits" field="7f1b-8591-2fcf-d01c" scope="upgrade" affects="profiles.Ranged Weapons" position="-1" join=", "/>
                <modifier type="append" value="Seeping Poisons" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" value="Lethal Hits" field="893f-9000-ccf7-648e" scope="upgrade" affects="profiles.Melee Weapons" position="-1" join=", "/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
          <comment>Death Guard specific Weapon Modification</comment>
        </selectionEntry>
      </selectionEntries>
    </selectionEntryGroup>
    <selectionEntryGroup name="Battle Scars" id="1576-e816-033f-828d" hidden="false">
      <constraints>
        <constraint type="max" value="3" field="selections" scope="self" shared="true" id="9825-f20a-66cc-7147" includeChildSelections="true"/>
      </constraints>
      <comment>Crusade content</comment>
      <selectionEntryGroups>
        <selectionEntryGroup name="Main Rules Battle Scars" id="39da-ebb3-1551-dd9e" hidden="false">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Battle-weary" hidden="false" id="856a-44c0-4d44-4fd6">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ed4f-7458-34ff-ae92" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Battle-weary" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4889-1296-cec0-fdbe">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit takes a Battle-shock, Leadership, Desperate Escape or Out of Action test, subtract 1 from that test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Crippling Damage" hidden="false" id="4135-1065-ae32-09a4">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="159e-81b2-f506-493f" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Crippling Damage" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="301a-57e2-10bd-abe2">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit cannot Advance and you must subtract 1&quot; from the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
              <modifierGroups>
                <modifierGroup type="and">
                  <comment>Battle Scars: Crippling Damage</comment>
                  <modifiers>
                    <modifier type="decrement" value="1" field="e703-ecb6-5ce7-aec1" affects="self.entries.profiles.Unit" scope="model-or-unit">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="4135-1065-ae32-09a4" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="63f1-e6e8-f6f6-a4f0" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="append" value="Crippling Damage" field="annotation" join=", " affects="self.entries.profiles.Unit" scope="model-or-unit">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="4135-1065-ae32-09a4" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="floor" value="0" field="e703-ecb6-5ce7-aec1" affects="self.entries.profiles.Unit" scope="model-or-unit">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="4135-1065-ae32-09a4" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="63f1-e6e8-f6f6-a4f0" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Deep Scars" hidden="false" id="e20d-1f8c-2b62-2abb">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9965-6300-9c34-fe31" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Deep Scars" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7588-ae4f-208e-e049">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a Critical Hit is scored against this unit, that attack automatically wounds this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Disgraced" hidden="false" id="e3a2-6b61-fd36-df18">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c2ac-ab01-45de-8eca" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Disgraced" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f179-c11e-72f3-2906">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You cannot use any Stratagems to affect this unit and this unit cannot be Marked for Greatness.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Fatigued" hidden="false" id="9d70-a94e-3f89-5eed">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="87a1-d9ce-1886-3f2c" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Fatigued" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7d0f-4235-b32f-77f2">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Subtract 1 from the Objective Control characteristic of models in this unit and this unit never receives a Charge bonus.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="decrement" value="1" field="bef7-942a-1a23-59f8" scope="model-or-unit" affects="self.entries.profiles.Unit">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="9d70-a94e-3f89-5eed" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="append" value="Fatigued" field="annotation" join=", " scope="model-or-unit" affects="self.entries.profiles.Unit">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="9d70-a94e-3f89-5eed" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="floor" value="0" field="bef7-942a-1a23-59f8" scope="model-or-unit" affects="self.entries.profiles.Unit">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="9d70-a94e-3f89-5eed" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <comment>Battle Scars: Fatigued</comment>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Mark of Shame" hidden="false" id="0e21-97c3-92fa-e2a1">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1ae4-98fb-48fc-f64c" includeChildSelections="false"/>
              </constraints>
              <profiles>
                <profile name="Mark of Shame" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="d8fe-6343-8c67-476d">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit cannot form an Attached unit, it is unaffected by the Aura abilities of friendly units, and it cannot be Marked for Greatness.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="-1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
              </costs>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="e66d-3831-dd6d-5f88" shared="true" includeChildSelections="true"/>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="7278-781b-ce6c-d23c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
          <comment>Crusade content</comment>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntryGroup>
    <selectionEntryGroup name="Battle Traits" id="0511-d9ad-2978-2234" hidden="false">
      <comment>Crusade content</comment>
      <selectionEntryGroups>
        <selectionEntryGroup name="Tyrannic War Battle Traits" id="b6e6-7945-adcc-eb15" hidden="false" collapsible="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Deadly Combatant" hidden="false" id="26be-2062-a96a-32fa">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="40ec-dc35-db4f-7462" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Deadly Combatant" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fe00-d1ed-cc9f-af99">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">All melee weapon equipped by **^^Character^^** models in this unit have the **[SUSTAINED HITS 1]** ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Sustained Hits" id="7729-92d6-11fd-8079" hidden="false" type="rule" targetId="1897-c22c-9597-12b1"/>
              </infoLinks>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Deadly Combatant" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Melee Weapons"/>
                    <modifier type="append" value="Sustained Hits 1" field="893f-9000-ccf7-648e" scope="model" affects="self.entries.recursive.profiles.Melee Weapons" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Born Hunter" hidden="false" id="1b97-e229-de15-8c46">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b800-1e62-da7e-01ae" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Born Hunter" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="173a-2c06-c7ff-d8fe">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Scouts 9&quot; ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Scouts" id="a312-8941-6a90-db23" hidden="false" type="rule" targetId="ada6-bac1-ffe0-d6f7">
                  <modifiers>
                    <modifier type="append" value="9&quot;" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Bio-acid Burns" hidden="false" id="a11a-0bc4-3e74-be0d">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7a11-6ca8-cf81-cb50" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Bio-acid Burns" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5cea-d2a8-a199-3ada">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Character^^** models in this unit have the Feel No Pain 5+ ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="985a-b647-e243-3b3f" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb">
                  <modifiers>
                    <modifier type="append" value="5+" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Natural Leader" hidden="false" id="970c-2e56-970e-12b8">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="aeb8-d427-cd7a-5c5c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Natural Leader" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8364-46f2-38a8-846b">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time you take a Battle-shock or Leadership test for this unit, you can re-roll that test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Tireless Raiders" hidden="false" id="517e-58d9-dfec-c800">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b24a-12f0-4f46-ea71" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Tireless Raiders" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="d14a-3cde-c35d-fa13">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit can make attacks with ranged weapons even when their unit is within Engagement Range of enemy units, but they can only make such attacks against enemy units that they are within Engagement Range of. In such circumstances, those models can target an enemy unit even if other friendly units are within Engagement Range of the same enemy unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Shadow Stalker" hidden="false" id="8f45-b4ba-7299-b90d">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f331-c979-2579-4a2e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Shadow Stalker" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6494-52de-0f34-f84a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Stealth ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Stealth" id="5f2c-04a4-18d1-29a2" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Death Incarnate (Aura)" hidden="false" id="d522-6da9-2b6e-1854">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="d0a2-c7dd-e913-1f58" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Death Incarnate (Aura)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="77ec-f5d9-6c29-c875">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an enemy unit is within 6&quot; of this unit, worsen the Leadership characteristic of models in that enemy unit by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Blessed Hull" hidden="false" id="1ff1-67fa-af94-1449">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="daae-766d-05ca-cccc" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Blessed Hull" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9946-99c9-bf5b-b03f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have a 5+ invulnerable save.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Focused Gunners" hidden="false" id="e5f2-bcf2-5c6b-0012">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6738-52ec-d092-f27d" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Focused Gunners" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0a7c-c752-f53e-ed90">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit do not suffer the penalty to Hit rolls for making ranged attacks while their unit is within Engagement Range of one or more enemy units.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Reinforced Superstructure" hidden="false" id="889a-143f-85b7-318f">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7620-8bad-9078-5813" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Reinforced Superstructure" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4ee6-6225-5888-59ce">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time an attack with a Strength characteristic of 7 or less is allocated to a model in this unit, worsen the Armour Penetration characteristic of that attack by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Elite Crew" hidden="false" id="1fff-1aa9-7fc9-6295">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c296-b0d3-f9d2-8809" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Elite Crew" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5b99-ce98-dc07-6089">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack, re-roll a Hit roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Archeotech Power Cell" hidden="false" id="114f-6903-9440-6051">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9dd2-c4b9-cb59-7056" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Archeotech Power Cell" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4258-8480-6cfb-8a9a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Archeotech Power Cell" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="e703-ecb6-5ce7-aec1" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Auto-repair Nodes" hidden="false" id="f09a-6b41-483c-147e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9639-5c4b-8d59-ca6d" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Auto-repair Nodes" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6633-39c0-087c-7bac">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, one model in this unit regains 1 lost wound.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Battle-scarred Resistance" hidden="false" id="13f1-9475-b20d-1b71">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="676d-7fa6-cadb-8a55" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Battle-scarred Resistance" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="2872-cb8d-09c1-83b9">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Feel No Pain 6+ ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="ae9d-f329-6a26-2288" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb">
                  <modifiers>
                    <modifier type="append" value="6+" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Vanguard Espionage" hidden="false" id="9342-4d42-3042-d47d">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3455-f4e0-52be-b8d4" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Vanguard Espionage" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="bf52-1646-5b05-6b57">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Scouts 9&quot; ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Scouts" id="51ab-7e2f-8922-7189" hidden="false" type="rule" targetId="ada6-bac1-ffe0-d6f7">
                  <modifiers>
                    <modifier type="append" value="9&quot;" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Obdurate Obedience" hidden="false" id="d908-df85-4e95-9888">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1369-9b07-4005-736c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Obdurate Obedience" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4280-0ad4-41db-e2b9">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Objective Control characteristic of all models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Obdurate Obedience" field="annotation" join=", " scope="root-entry" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="1" field="bef7-942a-1a23-59f8" scope="root-entry" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Resolute Veterans" hidden="false" id="dd0e-fa43-bbc1-579d">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1684-6b48-9acd-5728" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Resolute Veterans" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7540-1649-6e02-4718">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time you take a Battle-shock, Leadership or Desperate Escape test for this unit, add 1 to that test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Only The Swift Survive" hidden="false" id="e9bb-838d-d5cd-88c3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9be6-d0ad-3ce2-c33b" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Only The Swift Survive" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="80cc-c73c-14ee-8385">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to Advance and Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Headhunters" hidden="false" id="8c3a-90c3-e11b-4329">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="81b6-d6ca-9132-3e74" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Headhunters" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="99fc-06f4-f204-3524">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the battle, select one enemy unit (regardless of how many units in your Crusade army have this Battle Trait). Until the end of the battle, each time a model in this unit makes an attack against that enemy unit, re-roll a Hit roll of 1 and re-roll a Wound roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Hunter&apos;s Celerity" hidden="false" id="2879-b673-7355-efab">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a593-53d2-ba2e-bcbe" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Hunter&apos;s Celerity" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="e054-ec32-ab7d-87b3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Hunter&apos;s Celerity" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="e703-ecb6-5ce7-aec1" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="High-speed Gunnery" hidden="false" id="361f-3820-741e-8aaf">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="416a-9da4-c9e2-5163" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="High-speed Gunnery" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="47e7-f968-b74f-deb3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit Advances, until the end of the turn all ranged weapons equipped by models in this unit have the **[ASSAULT]** ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Assault" id="778b-0a0b-2f1e-b392" hidden="false" type="rule" targetId="fc8a-8c24-bae9-cc1c"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Predatory Urge" hidden="false" id="3235-b0da-b04d-ef17">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9ea5-b9b8-ce98-e231" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Predatory Urge" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="2d64-b6b2-fba2-aeab">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can re-roll Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Mounted Guerrillas" hidden="false" id="471d-cf1d-cb71-4810">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="97ee-f6d7-b44a-d5b0" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Mounted Guerrillas" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ca88-7fef-d230-82f8">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit is eligible to declare a charge in a turn in which it Fell Back.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Encircling Raptors" hidden="false" id="766e-c06d-bcc1-c148">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0331-71bc-ed9e-d1aa" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Encircling Raptors" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="c7f3-d332-f6ae-f067">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If this unit is in Strategic Reserves, it counts the battle round number as one higher than the current battle round number for the purpose of determining when and where it is set up.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Destructive Impulse" hidden="false" id="b776-cf8e-c23d-3796">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="97a8-46c1-6f7d-7429" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="0dce-ed3d-83af-2f27" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Destructive Impulse" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7fb4-b967-d90e-2ca7">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit destroys an enemy unit, add twice as many marks to its Tyrannic War Veteran tally as normal.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Rapid Adaptation" hidden="false" id="a4cc-8fae-4ffa-828a">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4386-3cc4-b21e-af11" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="0"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="0dce-ed3d-83af-2f27" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Rapid Adaptation" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9707-2fb8-348d-1a74">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select any one of the Battle Honours from the Monster Hunters upgrade path for this unit to gain, regardless of the ones it has already unlocked. The Battle Honour you select does not increase this unit&apos;s Crusade points total and does not count as an additional Battle Honour when determining the maximum number of Battle Honours this unit can have.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="c566-c14f-c589-5375" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Pariah Nexus Battle Traits" id="0272-ff62-2b5b-7390" hidden="false" collapsible="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Blur of Speed" hidden="false" id="e63b-dcbe-1d55-533a">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5b9c-34f2-276d-e12b" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Blur of Speed" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="583e-2616-8cf8-969d">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Stealth ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Stealth" id="ce48-cc2a-f75e-658d" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Lead From The Front" hidden="false" id="774e-76a1-64d6-26ae">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5936-8749-49ef-50f2" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Lead From The Front" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6151-b5a1-a259-9dc5">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Infiltrators ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Infiltrators" id="55f1-55c1-b3a7-2f99" hidden="false" type="rule" targetId="c05d-f4c3-f091-4938"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Horror-hardened" hidden="false" id="3b34-7366-3e49-0716">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cc33-c8a0-1130-2fdb" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Horror-hardened" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1f33-9d00-a7b7-1318">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can target this unit with Stratagems even while it is Battle-shocked.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Arch Acquisitor" hidden="false" id="5b89-792f-21e1-e7ce">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0f46-1606-5601-4c09" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Arch Acquisitor" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f1c8-284f-f4e0-482c">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 3 to the Objective Control characteristic of one **^^Character^^** model in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Arch Acquisitor" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit"/>
                    <modifier type="increment" value="3" field="bef7-942a-1a23-59f8" scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Claim Stalker" hidden="false" id="55c6-5b30-e007-4f1a">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="909f-96e9-eecb-5749" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Claim Stalker" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dac1-5e52-30c4-14d1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While this unit is within range of an objective marker, it has the Stealth ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Stealth" id="a276-06fd-afa7-fad0" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Heroic Constitution" hidden="false" id="e914-a455-0679-84a1">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e10b-76c9-8502-142e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Heroic Constitution" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f64e-f343-1ca9-0462">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Wounds characteristic of one **^^Character^^** model in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Heroic Constitution" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit"/>
                    <modifier type="increment" value="1" field="750a-a2ec-90d3-21fe" scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Duellist" hidden="false" id="1c02-28c1-b9c3-669c">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8d52-1892-ca11-c74e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Duellist" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="291e-fc3a-573c-a199">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a **^^Character^^** model in this unit makes a melee attack that targets a **^^Character^^** unit, you can re-roll the Hit roll.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Hardened Defences" hidden="false" id="a158-a64f-0eef-9ede">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="77db-6d29-a656-7316" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Hardened Defences" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="be58-26c9-487b-41de">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Feel No Pain 6+ ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="f4dc-92c4-3280-8e72" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb">
                  <modifiers>
                    <modifier type="append" value="6+" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Totemic Presence" hidden="false" id="986e-4f03-db70-9bd3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="86a6-2621-e8db-298c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Totemic Presence" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="40f8-bffb-92ff-7af2">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2 to the Objective Control characteristic of one model in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Totemic Presence" field="annotation" join=", " scope="model" affects="self.entries.profiles.Unit"/>
                    <modifier type="increment" value="2" field="bef7-942a-1a23-59f8" scope="model" affects="self.entries.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Tank Hunter" hidden="false" id="8626-ace8-2a23-5c95">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3eff-977e-679d-8f85" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Tank Hunter" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="37f3-8de0-b335-5482">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets a **^^Monster^^** or **^^Vehicle^^** unit, re-roll a Wound of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Stubborn Explorator" hidden="false" id="741f-d0fa-ab09-cba2">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b309-1596-ffae-9b40" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Stubborn Explorator" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4114-97f8-0b83-8355">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit makes a Normal or Advance move, it can move over terrain features that are 4&quot; or less in height as if they were not there.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Heavily Armoured" hidden="false" id="86e2-cc41-ea6d-29fb">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f760-479b-0322-c770" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Heavily Armoured" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ea8a-0172-ebe8-2258">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, when attack is allocated to a model in this unit, you can change the Damage characteristic of that attack to 0.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Reaper" hidden="false" id="37bd-2a0e-42cb-f516">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9f64-e723-3d9b-39cf" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Reaper" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ddbd-00dd-9f35-a5c1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets an **^^Infantry^^** or **^^Mounted^^** unit, re-roll a Hit roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Battle-scarred Resistance" hidden="false" id="2e0b-acea-fcfe-9093">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="00f6-471a-0d36-b221" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Battle-scarred Resistance" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="61e0-a37c-ca60-b36b">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Feel No Pain 6+ ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="0398-a57e-e8d9-b0a0" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb">
                  <modifiers>
                    <modifier type="append" value="6+" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Wraith of Ruin" hidden="false" id="c1a8-6da3-4244-6924">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8ab7-7b79-dad5-4b7c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Wraith of Ruin" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a261-085b-c6ac-de92">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Infiltrators ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Infiltrators" id="e6d9-3e84-e61f-22f3" hidden="false" type="rule" targetId="c05d-f4c3-f091-4938"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="United By Adversity" hidden="false" id="e4b1-08bd-20fc-e2cc">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4c41-42bb-7b1c-3523" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="United By Adversity" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ce60-226f-407f-96d5">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can target this unit with the Heroic Intervention Stratagem for 0CP, and can do so even if you have already targeted a different unit with that Stratagem this phase.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Raiders" hidden="false" id="42c3-a7a6-0709-ca44">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a91c-2686-bb39-ac8e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Raiders" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7f83-56b6-5344-3399">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets a unit that is within range of an objective marker, re-roll a Hit roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Purgators" hidden="false" id="ab2d-0fb5-cc15-0c8f">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7ae5-9a71-54e4-a6a0" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Purgators" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9354-4ef9-eda9-04a1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit gains the **^^Grenades^^** keyword. If it already has that keyword, once per battle, you can target this unit with the Grenade Stratagem for 0CP.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <categoryLinks>
                <categoryLink name="Grenades" hidden="false" id="f152-e9b6-b627-99ba" targetId="5a61-81ac-eb7c-a87e" primary="false"/>
              </categoryLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Terror Assault" hidden="false" id="c225-1b13-5512-c2bc">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0fd2-a69e-7fae-a07f" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Terror Assault" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="2064-7161-aa80-4859">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the Fight phase, select one enemy unit with Engagement Range of this unit. That enemy unit must take a Battle-shock test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Riders of Ruin" hidden="false" id="0ca7-40b8-e978-1d5e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8f48-f667-29c8-ac21" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Riders of Ruin" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a967-0164-e810-e25f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Riders of Ruin" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="e703-ecb6-5ce7-aec1" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Thundering Onslaught" hidden="false" id="40f7-f013-e684-02a0">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="885b-d139-d44e-0d62" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Thundering Onslaught" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5ff3-f50a-9614-31f9">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to Advance and Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Saddleborne Assassins" hidden="false" id="9c54-2886-35b2-2860">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2612-ab0f-150b-ec13" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Saddleborne Assassins" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="c680-6f61-e271-755f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes a ranged attack that targets the closest eligible target, improve the Armour Penetration characteristic of that attack by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Linebreakers" hidden="false" id="ed0c-efb2-4512-a7b5">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="560d-3176-adb1-fcfb" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Linebreakers" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6c9b-3ccc-ef75-6f19">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit ends a Charge move, until the end of the turn, melee weapons equipped by models in this unit have the **[SUSTAINED HITS 1]** ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Sustained Hits" id="86e3-1496-abf2-6f4b" hidden="false" type="rule" targetId="1897-c22c-9597-12b1"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Crushing Charge" hidden="false" id="a8b4-f920-4c98-0550">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7b5f-938f-f893-ed97" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Crushing Charge" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fc63-573b-1df5-5a97">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit ends a Charge move, select one enemy unit within Engagement Range of it, then roll one D6 for each model in this unit that is within Engagement Range of that enemy unit: for each 4+, that enemy unit suffers 1 mortal wound.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="41bc-337c-cae2-eb21" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Nachmund Gauntlet Battle Traits" id="5370-0734-ffdb-9fdf" hidden="false" collapsible="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Precision Insertion" hidden="false" id="ba7f-a586-d2f7-a8eb">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1fcd-5c3c-17d8-80cc" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Precision Insertion" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8541-0803-dadb-b6dd">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, when this unit is set up on the battlefield using the Deep Strike ability, it can perform a Precision Insertion. If it does, this unit can be set up anywhere on the battlefield that is more than 6&quot; horizontally away from all enemy units, but until the end of the turn, it is not eligible to declare a charge. Each time this unit performs a Surgical Deep Strike, add 2 to the Deep Strike test.

**Designer&apos;s Note:** *Only units that are set up using the Deep Strike ability with benefit from this Battle Trait.*</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Reinforced Armour" hidden="false" id="2b36-d9f3-133b-ad8e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e6f2-bd6f-9a1b-ac5e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Reinforced Armour" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="92bf-dcb5-53a9-21e3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time an attack with a Damage characteristic of 1 is allocated to a model in this unit, worsen the Armour Penetration characteristic of that attack by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Monstrous Momentum" hidden="false" id="98b4-d482-7308-520f">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="76e0-e2d2-0b8d-c6b2" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Monstrous Momentum" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3ec1-6635-447a-4535">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Monstrous Momentum" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="e703-ecb6-5ce7-aec1" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Behemoth" hidden="false" id="2bab-f848-8733-bb87">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9daf-5d47-383a-cff1" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Behemoth" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3c0e-8419-d6a2-62e4">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2 to the Wounds characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Behemoth" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="750a-a2ec-90d3-21fe" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Unrelenting" hidden="false" id="8024-a955-cfa7-595b">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="720a-91f3-8a35-a3ef" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Unrelenting" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="14a7-8766-06d2-972d">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can ignore any or all modifiers to this unit&apos;s Move characteristic. In addition, each time this unit makes a Normal move, models in this unit can move through terrain, but if any do so, after this unit has moved, roll one D6: on a 1-3 this unit is Battle-shocked.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Titan Slayer" hidden="false" id="f90e-a604-3826-23d3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a113-da4f-3283-7a55" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Titan Slayer" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9288-c3f1-6d75-c23e">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets a **^^Monster^^** or **^^Vehicle^^** unit, re-roll a Hit roll of 1. If that attack targets a **^^Titanic^^** unit, you can re-roll the Hit roll instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Talismanic" hidden="false" id="0aa8-7c21-9f12-0948">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0b05-98d5-cb93-6268" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Talismanic" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4919-0d6e-d17c-4723">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit is Marked for Greatness, it gains an additional 2XP.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Grim Survivors" hidden="false" id="78f5-68d6-c98e-9c73">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ad95-3587-89e6-c265" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Grim Survivors" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6db2-5b25-f309-17df">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, at the start of any phase, this unit can use this Battle Trait. If it does, until the end of the phase, models in this unit have the Feel No Pain 5+ ability. If this unit is Below Half-strength when this Battle Trait is used, then until the end of the phase, models in this unit have the Feel No Pain 4+ ability instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="4a71-e625-47ad-091f" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Drop Zone Defenders" hidden="false" id="4082-4ec3-f741-cb68">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3c8d-cd12-0050-1790" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Drop Zone Defenders" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="93f3-8562-9e5b-9d46">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While this unit is wholly within your deployment zone, improve the Leadership and Objective Control characteristics of models in this unit by 1. Each time an enemy unit performs a Surgical Deep Strike within 9&quot; of this unit, subtract 1 from that unit&apos;s Deep Strike test result.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Strikemasters" hidden="false" id="488a-30ac-1362-77c9">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a8bb-fc66-6843-09bf" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Strikemasters" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f897-769b-6000-9be0">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">In the Declare Battle Formations step, you can spend 1 Requisition point; if you do, then until the end of the battle, this unit has the Deep Strike ability and each time this unit performs a Surgical Deep Strike, add 1 to its Deep Strike test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Tempered In Battle" hidden="false" id="e3c3-fa79-9911-6aca">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="90f5-bd10-9ec3-077f" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Tempered In Battle" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ca46-189e-006e-e82d">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, in your Command phase, this unit can use this Battle Trait. If it does, until the end of the turn, this unit is eligible to shoot, declare a charge and perform an Action in a turn in which it Fell Back. In addition, this unit is eligible to perform an Action while it is Battle-shocked.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Fleet of Foot" hidden="false" id="dbfe-23d0-9eda-d75d">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="97d9-2f9f-afb2-6f29" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Fleet of Foot" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="619c-7f35-0f78-a3af">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can re-roll Advance rolls for this unit and this unit is eligible to perform an Action in a turn in which they Advanced. In addition, if this unit is selected to Advance, until the end of the turn, enemy units cannot use the Fire Overwatch Stratagem to shoot at this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Territorial" hidden="false" id="1697-a5b5-4b7b-e828">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ac71-fbf3-ac38-4d7d" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Territorial" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="495e-a4f1-9476-85e4">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets a unit is within range of an objective marker, re-roll a Wound roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Cavalry Outriders" hidden="false" id="825e-1846-43e4-4030">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0964-7f0a-ac43-7164" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Cavalry Outriders" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="30c1-2035-0347-3366">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Scouts 6&quot; ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Scouts" id="6300-6e6a-5a25-e9d4" hidden="false" type="rule" targetId="ada6-bac1-ffe0-d6f7">
                  <modifiers>
                    <modifier type="append" value="6&quot;" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Evasive" hidden="false" id="198d-d150-ae63-363e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b8d3-4958-8891-0187" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Evasive" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ee2f-447d-9c9d-ad63">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a ranged attack is allocated to a model in this unit, provided this unit did not Remain Stationary in your previous turn, worsen the Armour Penetration characteristic of that attack by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Shock Cavalry" hidden="false" id="d42c-f298-6f61-f160">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="d7ea-9f89-ee5a-0e96" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Shock Cavalry" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="12c4-7063-0640-084b">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets an enemy unit that is below its Starting Strength, add 1 to the Hit roll. In addition, each time a model in this unit makes an attack that targets an enemy unit that is Below Half-strength, add 1 to the Wound roll.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Sleek Interceptors" hidden="false" id="4289-35d0-142c-688b">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="42e3-896a-b256-1f58" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dda2-bb0a-215e-ad9c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Sleek Interceptors" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7025-2061-0804-18b9">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit Advances, do not make Advance roll for it. Instead, until the end of the phase, add 6&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Fiery Descent" hidden="false" id="c396-31ac-0f98-31f8">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="74bf-261c-3724-35ac" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dda2-bb0a-215e-ad9c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Fiery Descent" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dff8-839c-e49b-3e87">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, you can target this unit with the Rapid Ingress Stratagem for 0CP. If this unit performs a Surgical Deep Strike when doing so, before any Deep Strike tests are made, roll one D6 for each enemy unit within 6&quot; of your unit: on a 4+, that enemy unit suffers 1 mortal wound.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Take to the Skies" hidden="false" id="cab1-353f-4db0-682e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5e2b-7f5d-481b-ec3b" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dda2-bb0a-215e-ad9c" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Take to the Skies" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4c7c-c2fc-7bcc-c73e">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, at the end of your opponent&apos;s Fight phase, you can remove this unit from the battlefield and place it into Strategic Reserves.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Hunting Beasts" hidden="false" id="4c1a-4c1d-3b87-8bad">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a49d-1362-41d5-bf0a" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Hunting Beasts" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="359d-5a14-35d4-3fdb">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can re-roll Advance and Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Pouncing Predators" hidden="false" id="4f40-44de-1e36-437f">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="381c-92f0-af78-56ff" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Pouncing Predators" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3899-ea18-2582-fbcc">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can target this unit with the Heroic Intervention Stratagem for 0CP, and each time you do so, until the end of the turn, this unit has the Fights First ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Fights First" id="84cd-97a2-17f8-f101" hidden="false" type="rule" targetId="24-c886-e8ba-5a89"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Enhanced Endurance" hidden="false" id="b2c8-aaa5-4dfb-fbe9">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="fdf3-e128-fc15-1e23" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Enhanced Endurance" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a7b2-a36f-c6a5-3d5c">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Toughness characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Enhanced Endurance" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="1" field="d29d-cf75-fc2d-34a4" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Drop Zone Veterans" hidden="false" id="a9a8-2921-4de4-62da">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6270-4e8a-5f8d-98bb" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Drop Zone Veterans" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8d34-d242-a338-8e60">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit is set up on the battlefield using the Deep Strike ability, until the end of the turn, each time a model in this unit makes an attack, re-roll a Hit roll of 1 and re-roll a Wound roll of 1. Each time this unit performs a Surgical Deep Strike, you can re-roll the Deep Strike test.

**Designer&apos;s Note:** *Only units that are set up using the Deep Strike ability with benefit from this Battle Trait.*</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Stealthy Arrival" hidden="false" id="a6b3-611e-973b-44ea">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ab8e-45b3-364b-9c68" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Stealthy Arrival" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="85d8-e908-b885-b5b1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit is set up on the battlefield using the Deep Strike ability, until the end of your next turn, this unit has the Stealth ability and enemy units cannot use the Fire Overwatch Stratagem to shoot at this unit.

**Designer&apos;s Note:** *Only units that are set up using the Deep Strike ability with benefit from this Battle Trait.*</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Stealth" id="e478-ecc1-acbb-cef9" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="c9b3-8039-f1e9-c975" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Armageddon Battle Traits" id="9c28-2876-4721-62f5" hidden="false" collapsible="true">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Warp Terrors (Psychic)" hidden="false" id="b283-c2a9-13fd-21b4">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8aed-05e4-ff2b-ad12" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warp Terrors (Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a1ea-aab1-9189-c5e1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per turn, at the start of your Command phase, Movement phase, Shooting phase, or Charge phase, or the Fight phase, you can select one enemy unit within 18&quot; of this model. That unit must take a Battle-shock test, subtracting 1 from the test when it does so if it has one or more Warp counters.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Fortune&apos;s Favoured" hidden="false" id="7864-987f-04b1-abbe">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c7d7-ef59-ab4d-4bde" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Fortune&apos;s Favoured" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="be18-6e02-45c7-9ffd">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have a 6+ invulnerable save. While this unit has one or more Warp counters, models in this unit have a 5+ invulnerable save (excluding against Psychic Attacks).</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Warp-hardened Veterans" hidden="false" id="2c50-7b9e-ffaf-d455">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f66b-328d-867e-8cd7" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warp-hardened Veterans" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ef2d-1e34-4e2a-256a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit is Marked for Greatness, it gains an additional 2XP. In addition, once per battle, in your Command phase, you can add or remove one Warp counter to/from this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Adaptive Camouflage" hidden="false" id="5245-2894-d81e-d51e">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="5cf1-ca66-fa38-7d89" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Adaptive Camouflage" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7aa7-8172-3499-0ead">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Stealth ability and if this unit is in Strategic Reserves, it counts the battle round number as one higher than the current battle round number for the purpose of determining when and where it is set up.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Stealth" id="20b7-ab61-607a-fef0" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Stalwarts" hidden="false" id="6d14-584a-16d2-932c">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9804-a515-ac6b-aa23" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Stalwarts" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="039a-9fa3-d83f-1118">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, in your Command phase, this unit can use this Battle Trait. When it does, if it is Battle-shocked, it is no longer Battle-shocked and, until the end of the turn, this unit is eligible to perform an Action in a turn in which it Fell Back and/or while within Engagement Range of one or more enemy units.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Footsloggers" hidden="false" id="92ff-c4fc-ecec-3c7c">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9ae1-e3da-73be-f18c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Footsloggers" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0a22-f42b-2ddf-fea8">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Footsloggers" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="1" field="e703-ecb6-5ce7-aec1" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Warp Hunters" hidden="false" id="8e64-355a-0778-2d5c">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4127-9102-e391-d0e1" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warp Hunters" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dc03-6a23-e16b-3cf4">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack that targets the closest eligible target, you can re-roll a Wound roll of 1. If the target of that is an **^^Unbound Adversaries^^** unit, and it is the closest eligible target, you can re-roll the Wound roll instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Warding Inscriptions" hidden="false" id="3f5b-2433-0530-4f23">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b20c-2719-3c1e-e0d2" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warding Inscriptions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3c30-003c-fc9e-29ce">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in this unit have the Feel No Pain 6+ ability against Psychic Attacks and mortal wounds. While this unit has one or more Warp counters, models in this unit have the Feel No Pain 5+ ability against Psychic Attacks and mortal wounds.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="ea99-4ed5-7483-c1c2" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Advanced Suspensors" hidden="false" id="9fb1-e766-6b60-793f">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="51a7-106c-802f-e75d" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Advanced Suspensors" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a35c-3950-4d57-057c">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Ranged Weapons equipped by models in this unit have the **[ASSAULT]** ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Advanced Suspensors" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Ranged Weapons"/>
                    <modifier type="append" value="Assault" field="7f1b-8591-2fcf-d01c" scope="model-or-unit" affects="self.entries.recursive.profiles.Ranged Weapons" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
              <infoLinks>
                <infoLink name="Assault" id="b3e0-7002-cb6a-7a28" hidden="false" type="rule" targetId="fc8a-8c24-bae9-cc1c"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Extra Armour" hidden="false" id="bd62-2817-efff-a103">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ec8a-1027-21ee-1953" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Extra Armour" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5cb4-877b-8f87-e680">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Toughness characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Extra Armour" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="1" field="d29d-cf75-fc2d-34a4" scope="model-or-unit" affects="self.entries.recursive.profiles.Unit" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Juggernaut" hidden="false" id="5cfc-9526-1f87-9efc">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a498-6115-7f21-bf09" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Juggernaut" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ea86-e64e-2600-8253">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can ignore any or all modifiers to this unit&apos;s Move characteristic. In addition, each time this unit makes a Normal move, its models can move through sections of terrain features more than 2&quot; in height, but if any do so, just after this unit has moved, roll one D6: on a 1-3 this unit is Battle-shocked.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Endless Rage" hidden="false" id="6813-9048-33f5-ed81">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b5e3-79a4-4a04-d2af" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Endless Rage" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8ad7-68a8-beaf-3629">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit is eligible to shoot and declare a charge in a turn in which it Fell Back.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Daemon Hunter" hidden="false" id="a738-ed65-3759-a759">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f457-e745-97b4-9b15" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true" includeChildSelections="false" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="dbd4-63-af05-998" shared="true" includeChildSelections="false" includeChildForces="false"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Daemon Hunter" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6f4e-0c0e-71b1-d237">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit targets an **^^Unbound Adversaries^^** unit, you can re-roll the Hit roll. In addition, at the Update Crusade Cards step, if this unit would gain XP from Dealers in Death, it gains 1 additional XP.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Tip of the Spear" hidden="false" id="0f83-14d6-4e73-786a">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9ee2-3239-1553-c685" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Tip of the Spear" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="d57e-3ffa-56bd-894f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Scouts 6&quot; ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Scouts" id="7b76-b0ae-2894-e709" hidden="false" type="rule" targetId="ada6-bac1-ffe0-d6f7">
                  <modifiers>
                    <modifier type="append" value="6&quot;" field="name" join=" "/>
                  </modifiers>
                </infoLink>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Skilled Riders" hidden="false" id="2c28-7a28-0b4c-8f04">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="713e-1d67-a5b3-cba0" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Skilled Riders" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="438d-b00c-e81a-5497">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit makes a Normal, Advance or Charge move, its models can move through sections of terrain features more than 2&quot; in height, but if any do so, just after this unit has moved, roll one D6: on a 1, this unit suffers D3 mortal wounds and is Battle-shocked; on a 2-3 this unit is Battle-shocked.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Reactive Redeployment" hidden="false" id="0f45-1f87-f171-fc2c">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0e01-5901-532c-f3d3" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Reactive Redeployment" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1485-9199-6622-9b6d">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">After both players have deployed their armies, you can redeploy this unit. When doing so, you can set this unit up in Strategic Reserves, regardless of how many units are already in Strategic Reserves.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="War Beasts" hidden="false" id="feb9-cb74-c5bb-8f61">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="855a-fb6f-e4ff-cf2e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="War Beasts" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="16c5-021a-5190-1d42">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to Advance and Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Leaping Frenzy" hidden="false" id="bc29-bfae-0ea6-b10b">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="aa9c-cb24-803f-b69f" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Leaping Frenzy" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0c9e-169b-11e5-c3a2">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit ends a Charge move, select one enemy unit within Engagement Range of it, then roll one D6 for each model in this unit that is within Engagement Range of that enemy unit, adding 1 to the result if this unit has 1 or more Warp counters: for each 5+, that enemy unit suffers 1 mortal wound.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Fearsome Predators (Aura)" hidden="false" id="fbcd-b33c-616d-2514">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c279-7fbe-be55-98af" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="4c3e-9310-a516-3590" shared="true" includeChildSelections="false" includeChildForces="false"/>
                  </conditions>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Fearsome Predators (Aura)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f76b-6411-cd78-ada6">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an enemy unit is within 6&quot; of this unit, worsen the Leadership and Objective characteristics of models in that unit by 1 (to a minimum of 1).</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Ritual of Shrouding (Psychic)" hidden="false" id="5af5-ea75-c0d5-b4d3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cc9f-57b3-7222-9626" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Ritual of Shrouding (Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7c37-65c5-df4f-62c3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the Deploy Crusade Armies step, you can spend 1RP; if you do, until the end of the battle, each model in this unit has the Infiltrators ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Infiltrators" id="7f8d-1cff-ab1e-8784" hidden="false" type="rule" targetId="c05d-f4c3-f091-4938"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Warp Focus (Psychic)" hidden="false" id="5190-d5c0-1c38-2697">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e065-09ff-f9d6-b6d4" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warp Focus (Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1377-3875-ed15-5926">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Strength characteristic of Psychic weapons equipped by models in this unit. While this unit has one or more Warp counters, add 2 to the Strength characteristic of Psychic weapons equipped by models in this unit instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Warp Focus" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons"/>
                    <modifier type="increment" value="1" field="2229-f494-25db-c5d3" scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons" join=", "/>
                    <modifier type="append" value="Warp Focus" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Melee Weapons"/>
                    <modifier type="increment" value="1" field="ab33-d393-96ce-ccba" scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Melee Weapons" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Scrier&apos;s Gaze (Aura, Psychic)" hidden="false" id="2317-bd50-51d4-7894">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="02b9-3135-5ad2-966e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Scrier&apos;s Gaze (Aura, Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="86ef-191f-7164-45fb">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Enemy units that are set up on the battlefield from Reserves cannot be set up within 12&quot; of this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Warp Alacrity (Psychic)" hidden="false" id="8317-4f41-1bdc-c9b3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="97d0-bc63-26a4-7f8f" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Warp Alacrity (Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ef24-3c97-c267-bdaf">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You can re-roll Advance and Charge rolls for this unit. In addition, each time this unit is selected to Advance, you can remove one Warp counter from it. If you do, then until the end of the turn, this unit is not eligible to declare a charge (even if another rule would let it Advance and Charge in the same turn), but you do not make an Advance roll; instead, until the end of the phase, add 6&quot; to the Move characteristic of models in this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Force Shield (Psychic)" hidden="false" id="f3c8-27fa-c98d-a4bd">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8530-271d-ed73-5209" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="equalTo" value="0" field="selections" scope="root-entry" childId="13bf-2bee-3ae0-b414" shared="true" includeChildSelections="true" includeChildForces="false"/>
                        <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Force Shield (Psychic)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3a48-4edb-7e5f-ba05">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time an attack targets this unit (excluding Psychic Attacks), if the Strength characteristic of that attack is greater than the Toughness characteristic of this unit, subtract 1 from the Wound roll.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="5700-66f7-a020-7386" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntryGroup>
    <selectionEntryGroup name="Crusade Relics" id="e919-5b46-974d-a5b1" hidden="false">
      <comment>Crusade content</comment>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <selectionEntryGroups>
        <selectionEntryGroup name="Pariah Nexus Crusade Relics" id="75a8-00a9-374c-abfc" hidden="false" collapsible="true">
          <selectionEntryGroups>
            <selectionEntryGroup name="Antiquity Relics" id="0d0a-e87a-2e94-3302" hidden="false" sortIndex="2">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Eye of Mars" hidden="false" id="e40d-851c-707e-4af8">
                  <profiles>
                    <profile name="Eye of Mars" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="cd84-ee7d-2121-b084">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">After both players have deployed their armies, select one unit from your Crusade army and redeploy it. When doing so, you can set that unit up in Strategic Reserves if you wish, regardless of how many units are already in Strategic Reserves.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="1ce6-fd32-377a-472b" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="e40d-851c-707e-4af8" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="e40d-851c-707e-4af8" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Noctilith Sigil" hidden="false" id="9c0d-a069-aa54-f3ce">
                  <profiles>
                    <profile name="Noctilith Sigil" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fc20-e371-673f-b15b">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Non-**^^Psyker^^** model only. Models in the bearer&apos;s unit have the Feel No Pain 4+ ability against Psychic Attacks.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="8a4b-ec4d-4f7d-4085" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="9c0d-a069-aa54-f3ce" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="9c0d-a069-aa54-f3ce" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Feel No Pain" id="7e23-f156-3254-c948" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Dolmen Key" hidden="false" id="5ca0-58ef-7b1f-bd83">
                  <profiles>
                    <profile name="Dolmen Key" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6804-f3a7-e6fc-ed80">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in the bearer&apos;s unit have the Deep Strike ability. In addition, you can target the bearer&apos;s unit with the Rapid Ingress Stratagem for 0CP, and when resolving that Stratagem, you can set up that unit anywhere on the battlefield that is more than 6&quot; horizontally away from all enemy units and within range of an objective marker. Until the end of the turn, that unit is not eligible to declare a charge.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="f953-51a9-ba4c-0b6f" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="5ca0-58ef-7b1f-bd83" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="5ca0-58ef-7b1f-bd83" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Deep Strike" id="40e5-6240-f490-7841" hidden="false" type="rule" targetId="7cb5-dd6b-dd87-ad3b"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Vantachren&apos;s Mirror" hidden="false" id="b81f-84ba-2c6b-60f9">
                  <profiles>
                    <profile name="Vantachren&apos;s Mirror" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="82ea-4b7b-dc1b-4ada">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in the bearer&apos;s unit have the Stealth ability. In addition, each time the bearer&apos;s unit is selected as a target of a charge, subtract 2 from the Charge roll.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="7079-bf2c-e840-4657" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="b81f-84ba-2c6b-60f9" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="b81f-84ba-2c6b-60f9" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Stealth" id="f95f-dde4-6d29-5b60" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
                  </infoLinks>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Legendary Relics" id="2318-0ba4-8d70-0eb1" hidden="false" sortIndex="3">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Rod of the Omnissiah" hidden="false" id="d77f-76d7-d7b9-2a88">
                  <profiles>
                    <profile name="Rod of the Omnissiah" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fc54-f313-bad7-6554">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, the bearer regains up to D3 lost wounds. Once per battle, at the start of your Command phase, if your Crusade army is in the Balanced Strategic Footing, the bearer can activate this Crusade Relic. If it does, select one enemy unit within Engagement Range of the bearer. That enemy unit suffers a number of mortal wounds equal to the number of wounds the bearer has regained as a result of this Crusade Relic during the battle.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="7641-b8fa-a539-4250" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="d77f-76d7-d7b9-2a88" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="d77f-76d7-d7b9-2a88" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Blade of the Dynast" hidden="false" id="b52e-e1d6-9577-3c62">
                  <profiles>
                    <profile name="Blade of the Dynast" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="84a7-ad58-2a81-91b0">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Improve the Strength, Damage and Armour Penetration characteristics of the bearer&apos;s melee weapons by 1. Once per battle, in your Charge phase, if your Crusade army is in the Aggressive Strategic Footing, the bearer can activate this Crusade Relic. If it does, until the end of the phase, add 2 to Charge rolls made for the bearer&apos;s unit.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="c7aa-320a-79e9-322f" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="b52e-e1d6-9577-3c62" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="b52e-e1d6-9577-3c62" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Blade of the Dynast" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Melee Weapons"/>
                        <modifier type="increment" value="1" field="ab33-d393-96ce-ccba" scope="model" affects="self.entries.recursive.profiles.Melee Weapons" join=", "/>
                        <modifier type="decrement" value="1" field="41a0-1301-112a-e2f2" scope="model" affects="self.entries.recursive.profiles.Melee Weapons" join=", "/>
                        <modifier type="append" value="+0" field="3254-9fe6-d824-513e" scope="model" affects="self.entries.recursive.4986-bf86-beb4-13ac.profiles.Melee Weapons" join="" arg="+0"/>
                        <modifier type="replace" field="3254-9fe6-d824-513e" scope="model" affects="self.entries.recursive.982b-de77-dd2d-d9bd.profiles.Melee Weapons" join="" arg="+0"/>
                        <modifier type="increment" value="1" field="3254-9fe6-d824-513e" scope="model" affects="self.entries.recursive.profiles.Melee Weapons" position="-1"/>
                        <modifier type="replace" field="3254-9fe6-d824-513e" scope="model" affects="self.entries.recursive.profiles.Melee Weapons" join="" arg="+0"/>
                        <modifier type="add" value="982b-de77-dd2d-d9bd" field="category" scope="model" join="" arg="+0" affects="self.entries.recursive.4986-bf86-beb4-13ac"/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Noctic Shield" hidden="false" id="4f40-eb2a-0f2c-e874">
                  <profiles>
                    <profile name="Noctic Shield" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4f92-1ba8-41bc-c802">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to the Toughness and Wounds characteristic of the bearer. Once per battle, when an attack targets the bearer&apos;s unit, if your Crusade army is in the Defensive Strategic Footing, the bearer can activate this Crusade Relic. If it does, until the end of the phase, each time an attack is allocated to a model in the bearer&apos;s unit, subtract 1 from the Damage characteristic of that attack.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="0c46-3672-8529-adad" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="4f40-eb2a-0f2c-e874" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="4f40-eb2a-0f2c-e874" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Noctic Shield" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Unit"/>
                        <modifier type="increment" value="1" field="d29d-cf75-fc2d-34a4" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                        <modifier type="increment" value="1" field="750a-a2ec-90d3-21fe" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Artificer Relics" id="8499-7f71-1bec-32ce" hidden="false" sortIndex="1">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Armour of the Soulless Sentry" hidden="false" id="05b5-656b-8904-ceea">
                  <profiles>
                    <profile name="Armour of the Soulless Sentry" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="09ac-1f7a-8636-dc1f">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Improve the Toughness and Save characteristics of the bearer by 1.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="5aa3-5b22-0639-d821" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="05b5-656b-8904-ceea" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="05b5-656b-8904-ceea" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Armour of the Soulless Sentry" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Unit"/>
                        <modifier type="increment" value="1" field="d29d-cf75-fc2d-34a4" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                        <modifier type="decrement" value="1" field="450-a17e-9d5e-29da" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                        <modifier type="floor" value="2" field="450-a17e-9d5e-29da" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Veil of Ancients" hidden="false" id="cd94-4667-d67c-ead3">
                  <profiles>
                    <profile name="Veil of Ancients" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="b3f3-dac8-f2ac-2a06">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has a 4+ invulnerable save.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="a739-0f4c-22db-ab12" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="cd94-4667-d67c-ead3" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="cd94-4667-d67c-ead3" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Blackstone Compass" hidden="false" id="6b1f-f5ee-4471-c2bb">
                  <profiles>
                    <profile name="Blackstone Compass" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8b10-b5c2-007f-2d0f">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">After you win a battle, if the bearer is on the battlefield, you gain an additional 2 Blackstone Fragments.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="44f9-2a3a-96eb-2a37" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="6b1f-f5ee-4471-c2bb" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="6b1f-f5ee-4471-c2bb" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Treasure of the Technomandrites" hidden="false" id="0fbc-9dce-f882-48ad">
                  <profiles>
                    <profile name="Treasure of the Technomandrites" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5311-f846-c528-3e84">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one weapon equipped by the bearer (excluding a weapon that has been replaced by an Enhancement or upgraded via the Weapon Modifications table), then select one of the abilities below for that weapon to gain. That weapon is now a Crusade Relic; note this on the bearer&apos;s Crusade card and give the weapon a suitable name.

- **[LETHAL HITS]**
- **[PRECISION]**
- **[SUSTAINED HITS 1]**</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="92c7-6b54-e909-91ef" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="0fbc-9dce-f882-48ad" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="0fbc-9dce-f882-48ad" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="07b8-2a06-de26-16d6" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="0fbc-9dce-f882-48ad" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Lethal Hits" id="f8df-411c-2f49-7716" hidden="false" type="rule" targetId="d1d1-611e-5191-1095"/>
                    <infoLink name="Sustained Hits" id="128d-cc2b-de55-f91c" hidden="false" type="rule" targetId="1897-c22c-9597-12b1"/>
                    <infoLink name="Precision" id="9925-0721-d889-af63" hidden="false" type="rule" targetId="9143-31ae-e0a6-6007"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Nameless Tome" hidden="false" id="8c3a-a64e-ce1b-446d">
                  <profiles>
                    <profile name="Nameless Tome" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dd14-2e6f-1274-d2b0">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While the bearer is on the battlefield, you can use the New Orders Stratagem for 0CP.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="23ff-f4bd-8177-d334" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="8c3a-a64e-ce1b-446d" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="8c3a-a64e-ce1b-446d" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="set" value="true" field="hidden">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="roster" childId="c00c-b9d6-e0f7-4c37" shared="true" includeChildSelections="true" includeChildForces="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Rod of Command" hidden="false" id="c34c-bad4-f04a-9cce">
                  <profiles>
                    <profile name="Rod of Command" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1f5e-dbbc-b14a-9478">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, before drawing cards from your Secondary Mission deck, if the bearer is on the battlefield, you can look at the top card of your Secondary Mission deck, then you can return that card to the bottom of your Secondary Mission deck.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="9076-2ca6-faa7-190f" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="c34c-bad4-f04a-9cce" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="c34c-bad4-f04a-9cce" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="set" value="true" field="hidden">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="roster" childId="c00c-b9d6-e0f7-4c37" shared="true" includeChildSelections="true" includeChildForces="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Shard of Shattered Futures" hidden="false" id="4d30-7d18-aed5-214b">
                  <profiles>
                    <profile name="Shard of Shattered Futures" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9bf2-831a-62c4-dea8">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the first battle round, if the bearer is in your Crusade army, you can remove up to three Secondary Mission cards from your Secondary Mission deck and discard them, If you do, you can must then reshuffle your Secondary Mission deck.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="621c-8981-4d73-0703" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="4d30-7d18-aed5-214b" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="4d30-7d18-aed5-214b" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="set" value="true" field="hidden">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="roster" childId="c00c-b9d6-e0f7-4c37" shared="true" includeChildSelections="true" includeChildForces="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
          </selectionEntryGroups>
          <comment>Crusade content</comment>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="41bc-337c-cae2-eb21" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Tyrannic War Crusade Relics" id="5a5c-df7d-ba6b-5441" hidden="false" collapsible="true">
          <selectionEntryGroups>
            <selectionEntryGroup name="Antiquity Relics" id="bf35-60e5-4472-2ec6" hidden="false" sortIndex="2">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Archeotech Nano-med" hidden="false" id="6a90-b825-b5e1-931f">
                  <profiles>
                    <profile name="Archeotech Nano-med" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0b3b-1380-b77a-5c92">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Infantry^^** model only. The first time the bearer is destroyed, you can choose to roll one D6 at the end of the phase instead of using any rules that are triggered when a model is destroyed. If you do, on a 4+, set the bearer back up on the battlefield as close as possible to where they were destroyed and more than 1&quot; away from all enemy models, with D3 wounds remaining. If the bearer was part of an Attached unit when it was destroyed, and its Bodyguard unit is still on the battlefield when the bearer is set back up, it must be placed in Unit Coherency with that unit again to form an Attached unit. You do not need to take an Out of Action test for the bearer at the end of the battle unless it is destroyed again.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="a287-0d95-3503-2a39" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="6a90-b825-b5e1-931f" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="6a90-b825-b5e1-931f" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Sigil of Sol" hidden="false" id="9d47-75ae-6c66-b58c">
                  <profiles>
                    <profile name="Sigil of Sol" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fc31-bfee-9765-9af2">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle round, if the bearer is on the battlefield when you use a Strategic Ploy Stratagem, you can use that Stratagem without spending any CP.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="3a1d-c0ab-3859-4a0e" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="9d47-75ae-6c66-b58c" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="9d47-75ae-6c66-b58c" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Cranium Obscura" hidden="false" id="a88f-f874-3cdd-9f49">
                  <profiles>
                    <profile name="Cranium Obscura" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="2aa8-048c-cf96-be49">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Cannot be taken by **^^Psyker^^** models. Each time a Psychic Attack targets the bearer&apos;s unit, subtract 1 from that attack&apos;s Hit roll.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="984d-3e8c-16b9-03b1" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="a88f-f874-3cdd-9f49" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="a88f-f874-3cdd-9f49" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Shadesplinter Cloak" hidden="false" id="6e99-6b8f-a137-5dd1">
                  <profiles>
                    <profile name="Shadesplinter Cloak" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6ad8-c713-f166-c037">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Unless the bearer is part of an Attached unit at the start of the battle, it has the Lone Operative ability.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="e853-23b8-36f3-2d98" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="6e99-6b8f-a137-5dd1" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="6e99-6b8f-a137-5dd1" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Lone Operative" id="d495-11d7-00cf-4686" hidden="false" type="rule" targetId="a8a0-8fe7-898-e0f3"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Lantern of Detestation" hidden="false" id="6aa0-1222-ba18-6665">
                  <profiles>
                    <profile name="Lantern of Detestation" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="25fb-f968-ea54-fa54">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your opponent&apos;s Movement phase, for each enemy unit (excluding **^^Imperium^^** and **^^Chaos^^** units) within Engagement Range of the bearer, roll one D6: on a 4+. until the end of the phase, that unit cannot be selected to Fall Back.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="e596-43fc-b47f-db00" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="6aa0-1222-ba18-6665" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="6aa0-1222-ba18-6665" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Shard of Dying Light" hidden="false" id="c8b5-e565-15b4-be27">
                  <profiles>
                    <profile name="Shard of Dying Light" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="523d-6d7f-a2b3-581a">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Psyker^^** model only. Each time the bearer makes a Psychic Attack, add 1 to that attack&apos;s Wound roll.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="be20-9bda-af75-8d6f" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="c8b5-e565-15b4-be27" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="c8b5-e565-15b4-be27" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Legendary Relics" id="c1dc-8e46-fd08-8aba" hidden="false" sortIndex="3">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Gheist Prism Field" hidden="false" id="f2b3-9324-ed28-05aa">
                  <profiles>
                    <profile name="Gheist Prism Field" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="de45-77ab-837e-748a">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time the bearer makes a Normal, Advance or Fall Back move, until that move is finished, it can move horizontally through models and terrain features (it cannot finish a move on top of another model or its base). If doing so when making a Fall Back move, models in this unit do need to take a Desperate Escape test. After it has finished moving, select one enemy unit it moved across (if any) and roll one D6: on a 2+, that unit suffers D3 mortal wounds.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="cee6-0572-5c14-104d" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="f2b3-9324-ed28-05aa" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="f2b3-9324-ed28-05aa" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Vortex Grenade" hidden="false" id="d0ad-c653-466e-a860">
                  <profiles>
                    <profile name="Vertebrax of Vodun" typeId="f77d-b953-8fa4-b762" typeName="Ranged Weapons" hidden="false" id="afcc-75f3-b4df-3302">
                      <characteristics>
                        <characteristic name="Range" typeId="9896-9419-16a1-92fc">6&quot;</characteristic>
                        <characteristic name="A" typeId="3bb-c35f-f54-fb08">1</characteristic>
                        <characteristic name="BS" typeId="94d-8a98-cf90-183e">2+</characteristic>
                        <characteristic name="S" typeId="2229-f494-25db-c5d3">*</characteristic>
                        <characteristic name="AP" typeId="9ead-8a10-520-de15">*</characteristic>
                        <characteristic name="D" typeId="a354-c1c8-a745-f9e3">*</characteristic>
                        <characteristic name="Keywords" typeId="7f1b-8591-2fcf-d01c">Assault</characteristic>
                      </characteristics>
                    </profile>
                    <profile name="Vortex Grenade" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="b999-edd4-8e79-7750">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer can only shoot with this weapon once per battle. When an attack is made with this weapon, if a hit is scored roll one D6 for each unit within 6&quot; of the target unit (excluding the target unit itself): on a 4+, the unit being rolled for suffers D3 mortal wounds. The target unit then suffers 3D3 mortal wounds.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="8c1c-fe87-1782-ad8b" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="d0ad-c653-466e-a860" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="d0ad-c653-466e-a860" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Assault" id="2feb-cf1f-0058-be49" hidden="false" type="rule" targetId="fc8a-8c24-bae9-cc1c"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Null-field Disruptor" hidden="false" id="dba3-045b-5786-9d39">
                  <profiles>
                    <profile name="Null-field Disruptor" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="81a6-e01e-03b3-4125">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time the bearer makes a melee attack, invulnerable saving throws cannot be made against that attack.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="24cf-7642-8735-ae4a" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="dba3-045b-5786-9d39" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="dba3-045b-5786-9d39" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Vertebrax of Vodun" hidden="false" id="492f-7d54-0a84-21e8">
                  <profiles>
                    <profile name="Vertebrax of Vodun" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5109-2625-e190-8ddc">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, select one friendly model on the battlefield (excluding the bearer) and then select one Aura ability that selected model has. Until the start of your next Command phase, the bearer has that Aura ability.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="1026-4658-a2e7-3d14" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="492f-7d54-0a84-21e8" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="492f-7d54-0a84-21e8" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Artificer Relics" id="84ad-429b-810f-9f63" hidden="false" sortIndex="1">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Crimson Medallion of Bastior" hidden="false" id="a69c-fb1d-07fa-2194">
                  <profiles>
                    <profile name="Crimson Medallion of Bastior" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dfd8-89bd-1c1f-385c">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, if the bearer is within range of an objective marker that you control, roll one D6: on a 4+, you gain 1CP.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="4000-96ad-0705-8476" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="a69c-fb1d-07fa-2194" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="a69c-fb1d-07fa-2194" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Master-crafted Armour" hidden="false" id="2b62-7b30-e912-90ef">
                  <profiles>
                    <profile name="Master-crafted Armour" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6d38-3938-1582-d2fa">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to armour saving throws made for the bearer.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="6a00-8b99-b82d-fc8c" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="2b62-7b30-e912-90ef" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="2b62-7b30-e912-90ef" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Artificer Weapon" hidden="false" id="be3b-002c-05eb-b21f">
                  <profiles>
                    <profile name="Artificer Weapon" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="39dc-f5a6-364d-51ac">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one weapon that the bearer is equipped with (excluding a weapon that has been replaced by an Enhancement or upgraded via the Weapon Modifications Battle Trait). Make a note on the bearer&apos;s Crusade card of this weapon and give it a suitable name. That weapon is now a Crusade Relic and each time the bearer makes an attack with it, on a Critical Hit, the target suffers 1 mortal wound in addition to any normal damage.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="5616-4459-ef9b-3259" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="be3b-002c-05eb-b21f" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="be3b-002c-05eb-b21f" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="80bb-b4df-b32c-6625" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="be3b-002c-05eb-b21f" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Biosplint Gland" hidden="false" id="a55e-b0b2-21d9-6a9a">
                  <profiles>
                    <profile name="Biosplint Gland" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="179e-a700-2330-1df8">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time the bearer&apos;s unit ends Charge moved, select one enemy unit within Engagement Range of the bearer. Until the end of the turn, each time a model in that enemy unit makes an attack, subtract 1 from that attack&apos;s Hit roll.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="3189-9d43-0504-588d" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="a55e-b0b2-21d9-6a9a" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="a55e-b0b2-21d9-6a9a" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
          </selectionEntryGroups>
          <comment>Crusade content</comment>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="c566-c14f-c589-5375" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Nachmund Gauntlet Crusade Relics" id="2910-0a1e-8c87-584f" hidden="false" collapsible="true">
          <selectionEntryGroups>
            <selectionEntryGroup name="Antiquity Relics" id="4632-2aec-f2f0-1f74" hidden="false" sortIndex="2">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Sigil of Psychic Amplification" hidden="false" id="80e0-f520-e1c1-a053">
                  <profiles>
                    <profile name="Sigil of Psychic Amplification" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3b8e-9a70-bbdd-a08d">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Psyker^^** model only. Add 6&quot; to the Range characteristic of the bearer&apos;s ranged **[PSYCHIC]** weapons. If the bearer has Psychic ability that instructs you to select one or more units within a specified range, you can increase the range of that ability by 6&quot;. If the bearer has a Psychic Aura ability, increase the range of that ability by an additional 3&quot;.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="8573-ebf4-8978-16fb" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="80e0-f520-e1c1-a053" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="80e0-f520-e1c1-a053" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Sigil of Psychic Amplification" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons"/>
                        <modifier type="increment" value="6" field="9896-9419-16a1-92fc" scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons" join=", "/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Hammer of the Heavens" hidden="false" id="750a-a70b-acda-7535">
                  <profiles>
                    <profile name="Hammer of the Heavens" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1a4e-66a5-9aad-1abb">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, in your Command phase, if the bearer is on the battlefield, you can use this ability. Select one point on the battlefield and place a marker on that point. At the start of your next Command phase, roll six D6 for each unit within 6&quot; of the centre of that marker, adding 2 to the roll for each unit within 3&quot; of the centre of that marker: for each 4+, that unit suffers 1 mortal wound. The marker is then removed.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="fd58-fc86-d1c2-1b1a" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="750a-a70b-acda-7535" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="750a-a70b-acda-7535" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Maelstrom Clarion" hidden="false" id="57db-463c-9183-846e">
                  <profiles>
                    <profile name="Maelstrom Clarion" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="228b-1dbc-bd3a-3e81">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Enemy units that are set up on the battlefield as Reinforcements cannot be set up within 12&quot; of the bearer.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="c695-a982-8d5a-da68" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="57db-463c-9183-846e" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="57db-463c-9183-846e" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Displacer Field" hidden="false" id="6f44-bb68-ab3e-8400">
                  <profiles>
                    <profile name="Displacer Field" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ee7e-b61e-3ae1-bd86">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle, at the end of your opponent&apos;s Shooting phase, if the bearer&apos;s unit is not within Engagement Range of one or more enemy units, and if it was targeted by one or more attacks during that phase, you can remove the bearer&apos;s unit from the battlefield and place it into Strategic Reserves. If you do, when you next set up the bearer&apos;s unit from Strategic Reserves, models in that have the Deep Strike ability until the end of that phase.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="025d-6cf0-450d-c610" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="6f44-bb68-ab3e-8400" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="6f44-bb68-ab3e-8400" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Deep Strike" id="2112-ff9a-7443-9d68" hidden="false" type="rule" targetId="7cb5-dd6b-dd87-ad3b"/>
                  </infoLinks>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Legendary Relics" id="ae01-42cd-e746-cc83" hidden="false" sortIndex="3">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Fate-forged Weapon" hidden="false" id="247c-5357-828e-4cc5">
                  <profiles>
                    <profile name="Fate-forged Weapon" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="bfda-e145-69af-3e6a">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one melee weapon equipped by the bearer (excluding a weapon that has been replaced by an Enhancement or Crusade Relic, or upgraded with any Battle Traits). That weapon is now a Crusade Relic and:

- Each time an attack is made with it, you can re-roll the Wound roll.
- Once per battle, at the start of the Fight phase, the bearer can unleash the power stored in that weapon. When they do, until the end of the turn, that weapon has the **[DEVASTATING WOUNDS]** ability and its Strength and Attacks characteristics are increased by a number equal to the current battle round number.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="456e-378d-fdc3-400c" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="247c-5357-828e-4cc5" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="247c-5357-828e-4cc5" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="f36f-9bf8-0744-3752" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="247c-5357-828e-4cc5" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Devastating Wounds" id="eeea-7900-bac9-d131" hidden="false" type="rule" targetId="be1e-ac8e-1e2c-3528"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Gloaming Mantle" hidden="false" id="e361-55a9-8723-0118">
                  <profiles>
                    <profile name="Gloaming Mantle" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9708-7ed7-4dc5-1c39">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has the Lone Operative and Stealth abilities. While the bearer is leading a unit, models in that unit have the Stealth ability and that unit can only be selected as the target of a ranged attack if the attacking model is within 18&quot;.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="ac42-0dce-75bf-0adc" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="e361-55a9-8723-0118" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="e361-55a9-8723-0118" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Stealth" id="e867-6ee3-04ca-75c7" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
                    <infoLink name="Lone Operative" id="7c9b-b292-0a2b-fea5" hidden="false" type="rule" targetId="a8a0-8fe7-898-e0f3"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Lyreth&apos;s Mirror" hidden="false" id="918e-897b-3958-8ac6">
                  <profiles>
                    <profile name="Lyreth&apos;s Mirror" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a20d-e72e-1d99-a6c0">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the end of your opponent&apos;s Movement phase, you can select one enemy unit that was set up one the battlefield within 12&quot; of the bearer&apos;s unit during this phase; the bearer&apos;s unit can then either:

- Shoot, but when resolving those attacks the bearer&apos;s unit can only target that enemy unit (and only if it is an eligible target).
- Declare a charge against that unit (note that even if this charge is successful, the bearer&apos;s unit does not received any Charge bonus this turn).</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="b37a-6474-797d-ca2c" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="918e-897b-3958-8ac6" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="918e-897b-3958-8ac6" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Artificer Relics" id="4040-4b66-3c50-c35a" hidden="false" sortIndex="1">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Auto-medicae" hidden="false" id="e74b-c7aa-7317-5e21">
                  <profiles>
                    <profile name="Auto-medicae" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="b88c-fc60-1872-a00a">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has the Feel No Pain 5+ ability.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="99f1-1d04-2e95-f7d9" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="e74b-c7aa-7317-5e21" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="e74b-c7aa-7317-5e21" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Feel No Pain" id="fc3e-81ef-fa4f-b8aa" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb">
                      <modifiers>
                        <modifier type="append" value="5+" field="name" join=" "/>
                      </modifiers>
                    </infoLink>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Strategic Laurels" hidden="false" id="aeaf-9127-dd94-5f14">
                  <profiles>
                    <profile name="Strategic Laurels" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a6ff-9170-4b23-11e2">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your first Command phase, if the bearer is on the battlefield, you gain 1CP. At the end of the battle, if the bearer is on the battlefield, you gain 1 Strategic Asset point (SAP).</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="28aa-f98d-bd4f-69e2" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="aeaf-9127-dd94-5f14" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="aeaf-9127-dd94-5f14" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Conversion Field" hidden="false" id="1f9e-4e81-c90e-ddd7">
                  <profiles>
                    <profile name="Conversion Field" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="258f-8850-ca4d-0e84">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Models in the bearer&apos;s unit have a 5+ invulnerable save against ranged attacks and each time a ranged attack is allocated to a model in the bearer&apos;s unit, on an unmodified saving throw of 6, the attacking unit suffers 1 mortal wound after it has finished making its attacks.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="2dbd-ec26-30f8-dd25" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="1f9e-4e81-c90e-ddd7" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="1f9e-4e81-c90e-ddd7" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Gene-toxin Autofont" hidden="false" id="3cb0-57d2-8e00-9f54">
                  <profiles>
                    <profile name="Gene-toxin Autofont" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="e1ae-43ac-d6c2-6e90">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one melee weapon equipped by the bearer (excluding a weapon that has been replaced by an Enhancement or Crusade Relic, or upgraded with any Battle Traits). That weapon is now a Crusade Relic and, in your Fight phase, after the bearer has fought, select one enemy unit hit by one or more of those attacks made with this weapon. Until the end of the battle, that enemy unit is poisoned. At the start of each player&apos;s Command phase, roll one D6 for each poisoned enemy unit on the battlefield: on a 1, the poison wears off and the unit is no longer poisoned; on a 2-3, that enemy unit suffers 1 mortal wound; on a 4+, that enemy unit suffers D3 mortal wounds.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="46c3-8bba-4828-e065" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="3cb0-57d2-8e00-9f54" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="3cb0-57d2-8e00-9f54" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="59bf-61aa-e8ff-07f3" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="3cb0-57d2-8e00-9f54" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
          </selectionEntryGroups>
          <comment>Crusade content</comment>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="c9b3-8039-f1e9-c975" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
        <selectionEntryGroup name="Armageddon Crusade Relics" id="7e29-d0e8-4322-2063" hidden="false" collapsible="true">
          <selectionEntryGroups>
            <selectionEntryGroup name="Antiquity Relics" id="7f60-14e0-5a5c-a000" hidden="false" sortIndex="2">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Sanguiflamme of Armageddon" hidden="false" id="50fb-8bb0-1a76-2c45">
                  <profiles>
                    <profile name="Sanguiflamme of Armageddon" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="212b-967c-d980-000d">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of your Command phase, if the bearer is within range of an objective marker you control, you can choose one of the following:

- Remove 1 Warp counter that the bearer&apos;s unit has. If you do, gain 1CP.
- Take a Leadership test for this model. If that test is passed, gain 1CP.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="6599-d385-296f-d09d" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="50fb-8bb0-1a76-2c45" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="50fb-8bb0-1a76-2c45" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Riftwalker&apos;s Astrolabe" hidden="false" id="5163-c165-6060-f961">
                  <profiles>
                    <profile name="Riftwalker&apos;s Astrolabe" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="31db-df9e-ad57-a5f5">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has the Deep Strike ability. While the bearer is leading a unit, models in that unit have the Deep Strike ability.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="2d0c-aae0-0a36-bbee" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="5163-c165-6060-f961" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="5163-c165-6060-f961" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Deep Strike" id="db10-cb75-7f59-5720" hidden="false" type="rule" targetId="7cb5-dd6b-dd87-ad3b"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Weapon of Renown" hidden="false" id="13d0-c7e2-1702-ff13">
                  <profiles>
                    <profile name="Weapon of Renown" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fc18-be59-bec1-4164">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one melee weapon that the bearer is equipped with (excluding a weapon that has been replaced by an Enhancement or upgraded via the Weapon Modifications Battle Trait). That weapon is now a Crusade Relic and it has the **[ANTI-UNBOUND ADVERSARIES 4+** and **[DEVASTATING WOUNDS]** abilities.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="5377-9df9-cafb-4f63" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="13d0-c7e2-1702-ff13" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="13d0-c7e2-1702-ff13" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="d931-d16c-638c-216c" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="13d0-c7e2-1702-ff13" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Devastating Wounds" id="2807-ea1e-dc0a-3d59" hidden="false" type="rule" targetId="be1e-ac8e-1e2c-3528"/>
                    <infoLink name="Anti-" id="c3ee-c53d-f362-5fe5" hidden="false" type="rule" targetId="4111-82e3-9444-e942"/>
                  </infoLinks>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Exorcist&apos;s Thurible" hidden="false" id="55d0-f3d4-6890-aa99">
                  <profiles>
                    <profile name="Exorcist&apos;s Thurible" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="c1e1-6b02-3509-324b">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has the Feel No Pain 5+ ability against mortal wounds and Psychic Attacks. In addition, once per battle, just after rolling to generate an Anomaly, you can remove one Warp counter the bearer has. If you do, you can change one of the dice that were part of that roll to a dice result of your choosing (changing the anomaly generated).</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="e3be-a133-ba09-6c44" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="55d0-f3d4-6890-aa99" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="55d0-f3d4-6890-aa99" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="2"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Feel No Pain" id="e42a-7953-1dc6-850a" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb"/>
                  </infoLinks>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Legendary Relics" id="6b1c-b3c4-21ae-d3c8" hidden="false" sortIndex="3">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Beast-ward Barbute" hidden="false" id="7fa8-f6a6-c1f3-6eb7">
                  <profiles>
                    <profile name="Beast-ward Barbute" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="caea-9ebe-9a0b-d0d7">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a **^^Beast^^** or **^^Monster^^** unit targets the bearer&apos;s unit, before making any attacks, that **^^Beast^^** or **^^Monster^^** unit must take a Battle-shock test. Each time a model in that **^^Beast^^** or **^^Monster^^** unit makes an attack that targets the bearer&apos;s unit, subtract 1 from the Hit roll and, if that test was failed, subtract 1 from the Wound roll as well. In addition, once per battle, in your Command phase, you can select one **^^Unbound Adversaries^^** unit within 18&quot; of the bearer. If you do, until the start of your next Command phase, that **^^Unbound Adversaries^^** unit loses the **^^Unbound Adversaries^^** keyword and is part of your Crusade army.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="67ee-456d-19a4-e62b" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="7fa8-f6a6-c1f3-6eb7" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="7fa8-f6a6-c1f3-6eb7" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Vengeance Totem" hidden="false" id="46d5-e6b7-2450-b3ad">
                  <profiles>
                    <profile name="Vengeance Totem" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="e18a-5c8b-5c2b-bbc2">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">When the bearer&apos;s unit is destroyed, roll on D6 for every enemy unit within 6&quot;: on a 4+, that enemy unit suffers D3 mortal wounds. Then, if the bearer&apos;s unit had one or more Warp counters when it was destroyed, you can set up one unit of **^^Unbound Adversaries^^** on the battlefield as close as possible to where the bearer&apos;s model was destroyed and not within Engagement Range of any enemy units. The Power Level of this unit is equal to the number of Warp counters the bearer&apos;s unit had.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="a922-855e-091b-c322" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="46d5-e6b7-2450-b3ad" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="46d5-e6b7-2450-b3ad" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Empyromancer&apos;s Focus" hidden="false" id="827f-a95f-19ba-13b4">
                  <profiles>
                    <profile name="Empyromancer&apos;s Focus" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="762d-28f4-b9c1-b28f">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Psyker^^** model only. The bearer&apos;s Psychic weapons gain the **[SUSTAINED HITS 2]** ability. In addition, at the end of the Set Warp Events step, if the bearer is in your Crusade army, you can choose to increase or decrease the intensity of the Warp Events use in that battle by 1 (to a minimum of 1 and a maximum of 3).</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="708b-6a2b-6d14-29ac" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="827f-a95f-19ba-13b4" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="827f-a95f-19ba-13b4" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <infoLinks>
                    <infoLink name="Sustained Hits" id="470d-656c-08d7-1df9" hidden="false" type="rule" targetId="1897-c22c-9597-12b1"/>
                  </infoLinks>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Empyromancer&apos;s Focus" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons"/>
                        <modifier type="append" value="Sustained Hits 2" field="7f1b-8591-2fcf-d01c" scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Ranged Weapons" join=", "/>
                        <modifier type="append" value="Empyromancer&apos;s Focus" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Melee Weapons"/>
                        <modifier type="append" value="Sustained Hits 2" field="7f1b-8591-2fcf-d01c" scope="model-or-unit" affects="self.entries.recursive.4546-4a0c-b3be-e84c.profiles.Melee Weapons" join=", "/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Warp-touched Weapon" hidden="false" id="07f8-50b6-543a-e5b4">
                  <profiles>
                    <profile name="Warp-touched Weapon" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1e6a-09c7-ab51-a292">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Infantry^^** or **^^Mounted^^** model only. Select one melee weapon that the bearer is equipped with (excluding a weapon that has been replaced by an Enhancement or upgraded via the Weapon Modifications Battle Trait). That weapon is now a Crusade Relic and you add 1 to the Attacks, Strength and Damage characteristic of that weapon. In addition, each time the bearer is selected to fight, you can first remove up to 3 Warp counters from the bearer&apos;s unit. For each Warp counter removed this way, until the end of the phase, add an additional 1 to the Attacks and Strength characteristics of that weapon.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="667a-3af0-7191-0718" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="07f8-50b6-543a-e5b4" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="07f8-50b6-543a-e5b4" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true"/>
                                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="root-entry" childId="any" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                    <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="99f2-ed97-edc9-27bd" shared="true" includeChildSelections="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="07f8-50b6-543a-e5b4" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="3"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
            <selectionEntryGroup name="Artificer Relics" id="57c5-8013-34f4-e65d" hidden="false" sortIndex="1">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Cowl of Vehemence" hidden="false" id="7983-b496-eb22-716a">
                  <profiles>
                    <profile name="Cowl of Vehemence" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f1c3-3754-c9fb-e086">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">**^^Psyker^^** model only. Each time the bearer makes a Psychic Attack, re-roll a Wound roll of 1. While the bearer&apos;s unit has one or more Warp counters, each time the bearer makes a Psychic Attack, you can re-roll the Wound roll instead.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="f840-00f3-e0de-4551" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="atLeast" value="1" field="selections" scope="roster" childId="7983-b496-eb22-716a" shared="true" includeChildForces="true" includeChildSelections="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="7983-b496-eb22-716a" shared="true" includeChildForces="true" includeChildSelections="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                          <conditions>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="13bf-2bee-3ae0-b414" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Periapt of the Righteous" hidden="false" id="f8f5-8f7c-fd2c-e738">
                  <profiles>
                    <profile name="Periapt of the Righteous" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="929d-9b6b-7244-74a9">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 2 to the bearer&apos;s Wounds characteristic. In addition, in your Command phase, you can remove one Warp counter the bearer&apos;s unit has. If you do, the bearer regains up to D3 lost wounds.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="da4d-60f3-6e71-b1d6" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="f8f5-8f7c-fd2c-e738" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="f8f5-8f7c-fd2c-e738" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                  <modifierGroups>
                    <modifierGroup type="and">
                      <modifiers>
                        <modifier type="append" value="Periapt of the Righteous" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit"/>
                        <modifier type="increment" value="2" field="750a-a2ec-90d3-21fe" scope="model-or-unit" affects="self.entries.recursive.9cfd-1c32-585f-7d5c.profiles.Unit" join=", "/>
                      </modifiers>
                    </modifierGroup>
                  </modifierGroups>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Tartarine Cuirass" hidden="false" id="637e-2af1-a578-2046">
                  <profiles>
                    <profile name="Tartarine Cuirass" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="dab9-88ab-e397-40a0">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time an attack is allocated to the bearer, subtract 1 from the Damage characteristic of that attack. This is not cumulative with any other modifiers that worsen the Damage characteristic of an attack.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="ca8a-3dfb-74d4-9a29" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="637e-2af1-a578-2046" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="637e-2af1-a578-2046" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
                <selectionEntry type="upgrade" import="true" name="Grimoire Abjuratis" hidden="false" id="8720-1065-956b-b828">
                  <profiles>
                    <profile name="Grimoire Abjuratis" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ee0a-1bef-400c-17c5">
                      <characteristics>
                        <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a **^^Beast^^** or **^^Monster^^** model makes an attack that targets the bearer&apos;s unit, subtract 1 from the Wound roll. If the attacking model is an **^^Unbound Adversaries^^** unit, subtract 1 from the Hit roll as well.</characteristic>
                      </characteristics>
                    </profile>
                  </profiles>
                  <constraints>
                    <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="2df6-6ede-6412-89ab" includeChildForces="true" includeChildSelections="true"/>
                  </constraints>
                  <modifiers>
                    <modifier type="set" value="true" field="hidden">
                      <conditionGroups>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="roster" childId="8720-1065-956b-b828" shared="true" includeChildForces="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="8720-1065-956b-b828" shared="true" includeChildForces="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </modifier>
                    <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                      </conditions>
                    </modifier>
                  </modifiers>
                  <costs>
                    <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                    <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                    <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                    <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                    <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
                  </costs>
                </selectionEntry>
              </selectionEntries>
            </selectionEntryGroup>
          </selectionEntryGroups>
          <comment>Crusade content</comment>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="5700-66f7-a020-7386" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntryGroup>
    <selectionEntryGroup name="Tyrannic War Battle Honours" id="1927-d905-041e-b914" hidden="false" collapsible="true">
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Tyrannic War Veteran Tally" hidden="false" id="3d5f-dcb4-104d-ccc9" sortIndex="3">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="7767-9b46-61a3-c62a" shared="true" includeChildSelections="true"/>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="fe0b-a773-b244-d6a3" shared="true" includeChildSelections="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Tyrannic War Veteran" hidden="false" id="7767-9b46-61a3-c62a" sortIndex="1">
          <categoryLinks>
            <categoryLink name="Monster Hunters" hidden="false" id="0cc7-0e96-96a5-e1ec" targetId="1532-9501-d870-4514" primary="false"/>
            <categoryLink name="Tyrannic War Veteran" hidden="false" id="5986-1684-040c-8a5c" targetId="26fe-d7cb-eb8f-77d4" primary="false"/>
          </categoryLinks>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1b0d-a726-af2e-ec7f" includeChildSelections="false"/>
          </constraints>
          <comment>Monster Hunters</comment>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Tyrannic War Veteran" hidden="false" id="fe0b-a773-b244-d6a3" sortIndex="2">
          <categoryLinks>
            <categoryLink name="Striding Behemoths" hidden="false" id="e8a7-8264-0136-a5c9" targetId="0dce-ed3d-83af-2f27" primary="false"/>
            <categoryLink name="Tyrannic War Veteran" hidden="false" id="53a2-710e-ed0a-8d3e" targetId="26fe-d7cb-eb8f-77d4" primary="false"/>
          </categoryLinks>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b070-2abc-f1a5-0d4d" includeChildSelections="false"/>
          </constraints>
          <comment>Striding Behemoths</comment>
        </selectionEntry>
      </selectionEntries>
      <selectionEntryGroups>
        <selectionEntryGroup name="Monster Hunters" id="bae5-5003-9266-c381" hidden="false">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Giantslayers" hidden="false" id="79d5-885d-8cc2-f885" sortIndex="1">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2fad-fd28-fb04-2c77" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Giantslayers" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="2948-fe70-8807-d6c3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes an attack against a **^^Monster^^** or **^^Vehicle^^** unit, re-roll a Hit roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Painful Lessons" hidden="false" id="8791-d292-d3df-69a2" sortIndex="3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="fabd-faa1-12d1-2366" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Painful Lessons" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0443-b9f5-0690-1c6a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a **^^Monster^^** or **^^Vehicle^^** unit makes an attack against this unit, worsen the Armour Penetration characteristic of that attack by 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Indomitable Defiance" hidden="false" id="faa2-8145-18a4-34c1" sortIndex="2">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3201-9f03-4436-700b" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Indomitable Defiance" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="987c-763c-e359-e995">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While this unit is within Engagement Range of any enemy **^^Monster^^** or **^^Vehicle^^** models, it automatically passes Battle-shock and Leadership tests.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Hamstringing Attacks" hidden="false" id="d441-8e0d-f984-52ee" sortIndex="4">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7253-d2d7-402b-76ed" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Hamstringing Attacks" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="c2be-b94d-d4cb-f914">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">In your Shooting phase, each time this unit is selected to shoot, after resolving its attacks, select one **^^Monster^^** or **^^Vehicle^^** unit that lost one or more wounds as a result of those attacks. Until the start of your next Shooting phase, subtract 2&quot; from the Move characteristic of models in that **^^Monster^^** or **^^Vehicle^^** unit and subtract 2 from Charge rolls made for that unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Titan&apos;s Bane" hidden="false" id="4556-4f10-f8fe-640c" sortIndex="6">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="67c4-3dd0-6330-7420" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Titan&apos;s Bane" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="717f-8db9-3efd-b18a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Weapons equipped by models in this unit have the **[ANTI-MONSTER 4+]** and **[ANTI-VEHICLE 4+]** abilities.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Anti-" id="22a4-0330-7c8c-11ca" hidden="false" type="rule" targetId="4111-82e3-9444-e942"/>
              </infoLinks>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Titan&apos;s Bane" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Melee Weapons"/>
                    <modifier type="append" value="Anti-Monster 4+, Anti-Vehicle 4+" field="893f-9000-ccf7-648e" scope="model-or-unit" affects="self.entries.recursive.profiles.Melee Weapons" join=", "/>
                    <modifier type="append" value="Titan&apos;s Bane" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Ranged Weapons"/>
                    <modifier type="append" value="Anti-Monster 4+, Anti-Vehicle 4+" field="7f1b-8591-2fcf-d01c" scope="model-or-unit" affects="self.entries.recursive.profiles.Ranged Weapons" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Nimble Defence" hidden="false" id="ab52-bc6a-1099-5000" sortIndex="5">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b2f8-dbf2-8156-3d7b" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Nimble Defence" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="38ac-2ed6-0bd7-e628">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a **^^Monster^^** or **^^Vehicle^^** unit makes an attack against this unit, models in this unit have the Feel No Pain 5+ ability against that attack.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Feel No Pain" id="37a1-4cee-41c4-34ad" hidden="false" type="rule" targetId="9bf4-280f-bbe2-6fbb"/>
              </infoLinks>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                    <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="7767-9b46-61a3-c62a" shared="true" includeChildSelections="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="8937-5c60-e52d-dd07">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="1" field="a18f-126f-0697-e5df">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="min" value="0" field="selections" scope="parent" shared="true" id="8937-5c60-e52d-dd07" includeChildSelections="false"/>
            <constraint type="max" value="3" field="selections" scope="parent" shared="true" id="a18f-126f-0697-e5df" includeChildSelections="false"/>
          </constraints>
        </selectionEntryGroup>
        <selectionEntryGroup name="Striding Behemoths" id="3930-e88e-dbea-3b42" hidden="false">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Thunderous Blows" hidden="false" id="d241-419d-402c-8a4c" sortIndex="1">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8cd8-ceb0-855d-2448" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Thunderous Blows" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7229-19e6-8032-8105">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit destroys an enemy unit, subtract 2 from that enemy unit&apos;s Out of Action test for this battle.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Indomitable Stature" hidden="false" id="0631-30ea-dc30-6668" sortIndex="2">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e270-9820-b1de-4c82" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Indomitable Stature" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3e8f-093a-1795-a68a">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a ranged attack is made against this unit, if the Strength characteristic of that attack is greater than this unit&apos;s Toughness characteristic, subtract 1 from that attack&apos;s Wound roll.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Monstrous Presence (Aura)" hidden="false" id="8b22-21b7-9d42-ed41" sortIndex="5">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7c96-f55b-b66d-364e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Monstrous Presence (Aura)" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="778a-e580-8c04-636f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an enemy unit is within Engagement Range of this unit:
- Subtract 1 from the Leadership characteristic of models in that enemy unit.
- Each time that unit takes a Battle-shock test, the Insane Bravery Stratagem cannot be used.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Prey Taker" hidden="false" id="31bd-ce57-db23-cd21" sortIndex="8">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3949-a927-1980-5a75" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Prey Taker" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="99ff-4ba1-2488-7c2f">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Add 1 to Advance and Charge rolls made for this unit.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Predatory Senses" hidden="false" id="a2b9-1412-57b8-d6f8" sortIndex="3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8c5f-f6c8-a027-7d0c" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Predatory Senses" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3928-4923-0ccb-858c">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes a ranged attack, re-roll a Hit roll of 1.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Sweeping Blow" hidden="false" id="1473-e060-09f0-2261" sortIndex="4">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0888-d0f0-f6da-4a34" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Sweeping Blow" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="38e1-9c82-18ed-4bf0">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a model in this unit makes a melee attack, if a Critical Wound is rolled, the target suffers 1 mortal wound in addition to any normal damage.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Shocking Celerity" hidden="false" id="14d4-1e97-4302-1654" sortIndex="10">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a77c-5dd6-2852-610d" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Shocking Celerity" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1b98-4934-a009-a454">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">This unit has the Fights First ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Fights First" id="4044-f647-fded-050e" hidden="false" type="rule" targetId="24-c886-e8ba-5a89"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Gargantuan Rage" hidden="false" id="a4b0-aae0-e3b9-d952" sortIndex="9">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="bab9-0ab3-fb24-567e" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Gargantuan Rage" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="6251-f857-24af-2a45">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Melee weapons models in this unit are equipped with have the **[SUSTAINED HITS 1]** ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Sustained Hits" id="5516-19a9-d714-1bd8" hidden="false" type="rule" targetId="1897-c22c-9597-12b1"/>
              </infoLinks>
              <modifierGroups>
                <modifierGroup type="and">
                  <modifiers>
                    <modifier type="append" value="Gargantuan Rage" field="annotation" join=", " scope="model-or-unit" affects="self.entries.recursive.profiles.Melee Weapons"/>
                    <modifier type="append" value="Sustained Hits 1" field="893f-9000-ccf7-648e" scope="model-or-unit" affects="self.entries.recursive.profiles.Melee Weapons" join=", "/>
                  </modifiers>
                </modifierGroup>
              </modifierGroups>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Unstoppable Advance" hidden="false" id="ee3c-b45a-e693-96f5" sortIndex="7">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7794-31a0-6f17-0712" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Unstoppable Advance" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="acc3-e888-1539-0b15">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit makes a Normal, Advance or Fall Back move, until that move is finished, models in this unit can move horizontally through models and terrain features (they cannot finish a move on top of another model or its base). If doing so when making a Fall Back move, models in this unit do not need to take a Desperate Escape test.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Massive Stomp" hidden="false" id="702d-9520-9430-7269" sortIndex="6">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a415-9daa-54ef-9b01" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Massive Stomp" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="459d-1377-d4a2-a93c">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time this unit is selected to fight in the Fight phase, before making any attacks, it can stomp. If it does so, select one enemy unit (excluding **^^Monster^^** and **^^Vehicle^^** units) within Engagement Range of it and roll one D6: on a 2-5, that enemy unit suffers D3 mortal wounds; on a 6, that enemy unit suffers 3 mortal wounds.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="fe0b-a773-b244-d6a3" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="max" value="3" field="selections" scope="parent" shared="true" id="d674-520e-d71b-1586" includeChildSelections="false"/>
          </constraints>
        </selectionEntryGroup>
      </selectionEntryGroups>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="9693-cf84-fe69-37a9" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="6dda-e157-334d-e93a" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="cf47-a0d7-7207-29dc" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="parent" childId="14a0-40c9-2748-ae6e" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="lessThan" value="1" field="selections" scope="roster" childId="c566-c14f-c589-5375" shared="true" includeChildSelections="true" includeChildForces="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <comment>Tyrannic War Crusade content</comment>
    </selectionEntryGroup>
    <selectionEntryGroup name="Pariah Nexus Blackstone Upgrades" id="66c2-2a46-e7ed-a935" hidden="false" collapsible="true">
      <selectionEntryGroups>
        <selectionEntryGroup name="Blackstone Battle Honours" id="eef7-e5fc-10bd-c99a" hidden="false" sortIndex="1">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Acquisitive Opportunist" hidden="false" id="5e47-9ac7-39ff-6bf0">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="3d57-aa90-d9d9-09c2" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="15"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Acquisitive Opportunist" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="9151-3662-778c-5014">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the battle, if the bearer is your **^^Warlord^^**, until the end of the battle, it gains the ability below that corresponds with the Strategic Footing you selected in the Select Strategic Footing step:

- **Aggressive:** Models in the bearer&apos;s unit have the Scouts 6&quot; ability.
- **Balanced:** The bearer has the Lone Operative ability.
- **Defensive:** Models in the bearer&apos;s unit have the Stealth ability.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Scouts" id="52a9-9537-ab07-2985" hidden="false" type="rule" targetId="ada6-bac1-ffe0-d6f7">
                  <modifiers>
                    <modifier type="append" value="6&quot;" field="name" join=" "/>
                  </modifiers>
                </infoLink>
                <infoLink name="Lone Operative" id="7e73-95e8-4033-d113" hidden="false" type="rule" targetId="a8a0-8fe7-898-e0f3"/>
                <infoLink name="Stealth" id="f5ef-e0bb-bd27-fbc8" hidden="false" type="rule" targetId="bec5-4288-34a6-ccfa"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Nodal Map" hidden="false" id="7e66-6018-d32e-dda3">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2e63-e583-1eb8-5675" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="20"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Nodal Map" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="fe53-d8dd-a036-1190">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While the bearer is within range of an objective marker, if the bearer&apos;s unit is Battle-shocked, change the Objective Control characteristic of models in that unit to 1, instead of 0.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Single-minded Seeker" hidden="false" id="5681-9ff8-c212-fd23">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="b87d-397d-cdf5-ae86" includeChildSelections="false"/>
              </constraints>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="10"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <profiles>
                <profile name="Single-minded Seeker" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="8bbd-a6fe-cfe6-67e1">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If the bearer is your **^^Warlord^^**, at the end of the battle, roll one D6, adding 2 to the roll if you won the battle. On a 6+, you gain 3 Blackstone Fragments.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
        </selectionEntryGroup>
        <selectionEntryGroup name="Blackstone Crusade Relics" id="4db6-cde6-c1ed-ed63" hidden="false" sortIndex="2">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Blackstone Amulet" hidden="false" id="98c5-b3e3-bbb7-e473">
              <profiles>
                <profile name="Blackstone Amulet" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="a8d7-cea2-091e-bb15">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a melee attack is allocated to the bearer, on an unmodified saving throw of 6, the attacking unit suffers 1 mortal wound after it has finished making its attacks. If that attack was made with a Psychic weapon, this effect applies on an unmodified saving throw of 5+ instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <constraints>
                <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="b80b-58cb-fbe8-5ff0" includeChildForces="true" includeChildSelections="true"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="roster" childId="98c5-b3e3-bbb7-e473" shared="true" includeChildForces="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="98c5-b3e3-bbb7-e473" shared="true" includeChildForces="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="20"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Empathic Disinclinator" hidden="false" id="3749-2ecb-6765-5b6e">
              <profiles>
                <profile name="Empathic Disinclinator" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="cb0f-bc11-da23-6ef2">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the start of the battle, select one objective marker. While the bearer is on the battlefield, friendly units within range of that objective marker have a 5+ invulnerable save.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <constraints>
                <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="0ab4-22d3-2a9d-ead8" includeChildForces="true" includeChildSelections="true"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="roster" childId="3749-2ecb-6765-5b6e" shared="true" includeChildForces="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="3749-2ecb-6765-5b6e" shared="true" includeChildForces="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="15"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Noctilith Armament" hidden="false" id="7499-0c7d-efd2-d306">
              <profiles>
                <profile name="Noctilith Armament" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7d92-20c4-91fa-38aa">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Select one melee weapon equipped by the bearer (excluding a weapon that has been replaced by an Enhancement or upgraded via the Weapon Modifications table). That weapon is now a Crusade Relic; note this on the bearer&apos;s Crusade card and give the weapon a suitable name. Once per battle, in the Fight phase, the bearer can activate this Crusade Relic. If it does, until the end of the phase, each time an attack is made with that weapon, invulnerable saving throws cannot be made against that attack.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <constraints>
                <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="beb8-e0ca-019f-acaf" includeChildForces="true" includeChildSelections="true"/>
              </constraints>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="roster" childId="7499-0c7d-efd2-d306" shared="true" includeChildForces="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="7499-0c7d-efd2-d306" shared="true" includeChildForces="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </modifier>
                <modifier type="set" value="2" field="b03b-c239-15a5-da55">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="5929-ad51-d006-e008" shared="true"/>
                  </conditions>
                </modifier>
                <modifier type="add" value="Must upgrade a weapon to a Crusade Relic" field="error">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="d36e-d497-6068-1b83" shared="true" includeChildSelections="true"/>
                    <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="7499-0c7d-efd2-d306" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
              </modifiers>
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="1"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="20"/>
                <cost name="Diplomatic Power" typeId="4d7c-04b6-8a79-837f" value="0"/>
                <cost name="Military Power" typeId="1cbe-d9c9-86a8-2d41" value="0"/>
              </costs>
            </selectionEntry>
          </selectionEntries>
        </selectionEntryGroup>
      </selectionEntryGroups>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true"/>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="41bc-337c-cae2-eb21" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <comment>Pariah Nexus Crusade content</comment>
    </selectionEntryGroup>
    <selectionEntryGroup name="Mighty Champions" id="f842-6e90-bc5a-80f1" hidden="false" defaultSelectionEntryId="none">
      <comment>Crusade content</comment>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="lessThan" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
          </conditions>
        </modifier>
      </modifiers>
      <selectionEntryGroups>
        <selectionEntryGroup name="Nachmund Gauntlet Crusade Abilities" id="b112-44a1-b89f-08b3" hidden="false" defaultSelectionEntryId="none">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="a1e8-4bda-9200-f7c7" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="1" field="2ae1-2126-75d9-62ee">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="roster" childId="a1e8-4bda-9200-f7c7" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Subtle Champions" hidden="false" id="bf5f-c031-cc7a-75b9">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Subtle Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1522-6b7f-2b61-97fa">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, at the Determine Attacker and Defender step, you can re-roll your dice when determining who will be the Attacker and who will be the Defender.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Front-line Champions" hidden="false" id="a757-f8d3-72fd-f259">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Front-line Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="cccd-cab2-1714-ac7e">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the declare Battle-formations step, select one Battle Trait. Until the end of the battle, this **^^Epic Hero^^** model, and any unit they join, are considered to have this Battle Trait.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Inspirational Champions" hidden="false" id="b7fd-2ada-f98d-f267">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Inspirational Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="c358-6a5e-8ae9-f95e">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an **^^Epic Hero^^** model with this Crusade ability is leading a unit, you can ignore any and/or all Battle Scars that Bodyguard unit has. In addition, if your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, at the end of the battle you can select one additional unit from your Crusade army to be Marked for Greatness.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Logistical Champions" hidden="false" id="a75b-2187-278b-345d">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Logistical Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0a2d-f811-3016-deb9">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, during the Determine Victor step, if you were the Victor of that battle, after gaining the Victor Bonus for that Crusade Mission, you gain that Victor bonus a second time.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Nemesis Champions" hidden="false" id="7811-f2c2-ea6d-3452">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Nemesis Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="e543-c501-ee31-0dce">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">During the battle, if one or more enemy **^^Character^^** models are destroyed by an attack made by an **^^Epic Hero^^** model (or a model in a unit it is attached to) with this Crusade Ability from your Crusade army, then at the Update Crusade Cards step, all units in your Crusade army gain an additional 1XP. If one of those destroyed enemy **^^Character^^** models was the enemy **^^Warlord^^**, you also gain 1 Strategic Asset Point.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Restorative Champions" hidden="false" id="db2b-318e-1e9c-5586">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Restorative Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="90eb-4c01-f086-3183">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with Crusade Ability, during the Update Crusade Cards step you can re-roll failed Out of Action tests for units in your Crusade army.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Strategic Champions" hidden="false" id="f8b1-010a-2447-c0e2">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Strategic Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ab06-683b-f433-9032">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade ability, then at the Select Crusade Blessings step, roll one D6: on 4+ select one of the following:
- If you are the Underdog, you can select one additional Crusade Blessing.
- If you are not the Underdog, you can select one Crusade Blessing, instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <constraints>
            <constraint type="min" value="0" field="selections" scope="parent" shared="true" id="2ae1-2126-75d9-62ee" includeChildSelections="true"/>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="793c-5182-d3fa-d350" includeChildSelections="true"/>
          </constraints>
        </selectionEntryGroup>
        <selectionEntryGroup name="Armageddon Crusade Abilities" id="bf32-3a87-fccc-86f2" hidden="false" defaultSelectionEntryId="none">
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditions>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="fd80-17e3-3c1a-6570" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="1" field="8132-2831-4549-7a70">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="roster" childId="fd80-17e3-3c1a-6570" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Front-line Champions" hidden="false" id="cdec-18f6-3a70-c6dc">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Front-line Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="4773-1d4a-88a5-fced">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">At the Declare Battle Formations step, select one of the following:

- While this model is leading a unit, weapons equipped by models in that unit the **[ANTI-UNBOUND ADVERSARIES 4+]** ability.
- Select one Armageddon Battle Trait (this must be a Battle Trait they could have if they were not an **^^Epic Hero^^**). Until the end of the battle, this **^^Epic Hero^^** model, and any unit they join, have this Battle Trait.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
              <infoLinks>
                <infoLink name="Anti-" id="5422-edab-3e98-ef3e" hidden="false" type="rule" targetId="4111-82e3-9444-e942"/>
              </infoLinks>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Inspirational Champions" hidden="false" id="2c04-6753-170b-2708">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Inspirational Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="7255-2c06-ecb5-7913">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">While an **^^Epic Hero^^** model with this Crusade ability is leading a unit, you can ignore any and/or all Battle Scars that Bodyguard unit has. If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, at the end of the battle, you can select one additional unit from your Crusade army to be Marked for Greatness.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Logistical Champions" hidden="false" id="532c-5eb9-f2cb-4696">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Logistical Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="b5cc-8184-2688-05f3">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, during the Determine Victor step, if you were the victor of that battle and if that **^^Epic Hero^^** is on the battlefield, you gain the Victor bonus a second time.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Nemesis Champions" hidden="false" id="ed3e-9e07-5c80-78dd">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Nemesis Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="075f-6b08-d98d-c352">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">During the battle, if one or more enemy **^^Character^^** models are destroyed by an attack made by an **^^Epic Hero^^** model (or a model in a unit it is attached to) with this Crusade Ability from your Crusade army, then at the Update Crusade Cards step, all units in your Crusade army gain an additional 1XP. If one of those destroyed enemy **^^Character^^** models was the enemy **^^Warlord^^**, you also gain 1 strategic point.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Restorative Champions" hidden="false" id="8ef5-b96c-0c7a-929a">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Restorative Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="405b-1a2f-c668-e9fb">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with Crusade Ability, you can re-roll failed Out of Action tests for units in your Crusade army.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Strategic Champions" hidden="false" id="1959-bce0-4c56-dffe">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Strategic Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="367e-e67e-6b31-2b66">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade ability, then at the Select Crusade Blessings step, select one of the following:

- If you are the Underdog, roll one D6: on a 4+, you can select one additional Crusade Blessing.
- If you are not the Underdog, roll one D6: on a 6 you can select one Crusade Blessing, instead.</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Subtle Champions" hidden="false" id="f8aa-a845-fa5a-3f62">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
                <cost name="Crusade Points" typeId="b03b-c239-15a5-da55" value="1"/>
                <cost name="Crusade: Battle Honours" typeId="75bb-ded1-c86d-bdf0" value="0"/>
                <cost name="Crusade: Experience" typeId="a623-fe74-1d33-cddf" value="0"/>
                <cost name="Crusade: Weapon Modifications" typeId="716d-91b7-d55a-1022" value="0"/>
                <cost name="Blackstone Fragments" typeId="ac6b-ced3-9b5e-9a6e" value="0"/>
              </costs>
              <profiles>
                <profile name="Subtle Champions" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="f389-249b-7e94-3496">
                  <characteristics>
                    <characteristic name="Description" typeId="9b8f-694b-e5e-b573">If your Crusade army includes one or more **^^Epic Hero^^** models with this Crusade Ability, select one of the following:

- At the Determine Attacker and Defender step, you can re-roll your dice when determining who will be the Attacker and who will be the Defender.
- At the end of the Set Warp Events step, roll one D6: on a 4+ you can choose to increase or decrease the intensity of the Warp Events used in that battle by 1 (to a minimum of 1 and a maximum of 3).</characteristic>
                  </characteristics>
                </profile>
              </profiles>
            </selectionEntry>
          </selectionEntries>
          <constraints>
            <constraint type="min" value="0" field="selections" scope="parent" shared="true" id="8132-2831-4549-7a70" includeChildSelections="true"/>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="0d12-fc01-f6a0-ebbb" includeChildSelections="true"/>
          </constraints>
        </selectionEntryGroup>
      </selectionEntryGroups>
    </selectionEntryGroup>
    <selectionEntryGroup name="Crusade Relic Upgrades" id="b678-4a99-210e-931f" hidden="false">
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Gene-toxin Autofont upgrade" hidden="false" id="59bf-61aa-e8ff-07f3">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="e39c-5e22-abb9-eed2" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="66db-d03a-2d0c-d3df" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="3cb0-57d2-8e00-9f54" shared="true" includeChildSelections="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="upgrade" childId="ccdd-3987-11ed-90cd" shared="true" includeChildSelections="false"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="59bf-61aa-e8ff-07f3" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="59bf-61aa-e8ff-07f3" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="59bf-61aa-e8ff-07f3" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="66db-d03a-2d0c-d3df">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="3cb0-57d2-8e00-9f54" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Gene-toxin Autofont" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Treasure of the Technomandrites upgrade" hidden="false" id="07b8-2a06-de26-16d6">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="a702-c9d7-905a-56d8" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="808a-fcdd-3be5-6a42" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="0fbc-9dce-f882-48ad" shared="true" includeChildSelections="true"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="07b8-2a06-de26-16d6" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="07b8-2a06-de26-16d6" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="07b8-2a06-de26-16d6" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="808a-fcdd-3be5-6a42">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="0fbc-9dce-f882-48ad" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <selectionEntryGroups>
            <selectionEntryGroup name="Weapon Abilities" id="86f4-1a93-192e-68bb" hidden="false" collapsible="true" defaultSelectionEntryId="none">
              <selectionEntries>
                <selectionEntry type="upgrade" import="true" name="Precision" hidden="false" id="e61a-5d5d-9393-e0c3"/>
                <selectionEntry type="upgrade" import="true" name="Lethal Hits" hidden="false" id="dad3-c44d-6954-0a02"/>
                <selectionEntry type="upgrade" import="true" name="Sustained Hits 1" hidden="false" id="aa7e-1d9b-be7d-3ed7"/>
              </selectionEntries>
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4a9d-b3a2-a0e4-9ee7" includeChildSelections="false"/>
                <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="0779-353b-c89d-c04b" includeChildSelections="false"/>
              </constraints>
            </selectionEntryGroup>
          </selectionEntryGroups>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Treasure of the Technomandrites" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" value="Treasure of the Technomandrites" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons"/>
                <modifier type="append" value="Lethal Hits" field="893f-9000-ccf7-648e" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="dad3-c44d-6954-0a02" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Lethal Hits" field="7f1b-8591-2fcf-d01c" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="dad3-c44d-6954-0a02" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Precision" field="893f-9000-ccf7-648e" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="e61a-5d5d-9393-e0c3" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Precision" field="7f1b-8591-2fcf-d01c" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="e61a-5d5d-9393-e0c3" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Sustained Hits 1" field="893f-9000-ccf7-648e" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="aa7e-1d9b-be7d-3ed7" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Sustained Hits 1" field="7f1b-8591-2fcf-d01c" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="parent" childId="aa7e-1d9b-be7d-3ed7" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Artificer Weapon upgrade" hidden="false" id="80bb-b4df-b32c-6625">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="4c1c-5a78-7a4c-07bf" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="20d8-03f9-b458-ed8b" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="be3b-002c-05eb-b21f" shared="true" includeChildSelections="true"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="80bb-b4df-b32c-6625" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="80bb-b4df-b32c-6625" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="80bb-b4df-b32c-6625" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="20d8-03f9-b458-ed8b">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="be3b-002c-05eb-b21f" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Artificer Weapon" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" value="Artificer Weapon" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Fate-forged Weapon upgrade" hidden="false" id="f36f-9bf8-0744-3752">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="e45a-a691-0851-b1bb" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="57a9-c508-fce9-d960" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="247c-5357-828e-4cc5" shared="true" includeChildSelections="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="upgrade" childId="ccdd-3987-11ed-90cd" shared="true" includeChildSelections="false"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="f36f-9bf8-0744-3752" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="f36f-9bf8-0744-3752" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="f36f-9bf8-0744-3752" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="57a9-c508-fce9-d960">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="be3b-002c-05eb-b21f" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Fate-forged Weapon" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Weapon of Renown upgrade" hidden="false" id="d931-d16c-638c-216c">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="7296-10af-0156-3a5b" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="c7de-2202-3302-511d" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="13d0-c7e2-1702-ff13" shared="true" includeChildSelections="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="upgrade" childId="ccdd-3987-11ed-90cd" shared="true" includeChildSelections="false"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="d931-d16c-638c-216c" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="d931-d16c-638c-216c" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="d931-d16c-638c-216c" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="c7de-2202-3302-511d">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="13d0-c7e2-1702-ff13" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Weapon of Renown" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" value="Anti-Unbound Adversaries 4+, Devastating Wounds" field="893f-9000-ccf7-648e" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Warp-touched Weapon upgrade" hidden="false" id="99f2-ed97-edc9-27bd">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="b341-537e-08d4-d056" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="7331-b6bd-2846-402e" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="07f8-50b6-543a-e5b4" shared="true" includeChildSelections="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="upgrade" childId="ccdd-3987-11ed-90cd" shared="true" includeChildSelections="false"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="99f2-ed97-edc9-27bd" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="99f2-ed97-edc9-27bd" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="99f2-ed97-edc9-27bd" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="7331-b6bd-2846-402e">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="07f8-50b6-543a-e5b4" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Warp-touched Weapon" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="increment" value="1" field="ab33-d393-96ce-ccba" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
                <modifier type="append" value="+0" field="2337-daa1-6682-b110" scope="upgrade" affects="e993-e086-6de1-12af.profiles.Melee Weapons" arg="+0" join=""/>
                <modifier type="replace" field="2337-daa1-6682-b110" scope="upgrade" affects="6337-b83b-0d1e-5770.profiles.Melee Weapons" arg="+0"/>
                <modifier type="increment" value="1" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" position="-1"/>
                <modifier type="decrement" value="1" field="2337-daa1-6682-b110" scope="upgrade" affects="84c4-6d1e-e724-bd6e.profiles.Melee Weapons" position="-1"/>
                <modifier type="replace" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" arg="+0"/>
                <modifier type="add" value="6337-b83b-0d1e-5770" field="category" scope="upgrade" arg="+0" affects="e993-e086-6de1-12af"/>
                <modifier type="append" value="+0" field="3254-9fe6-d824-513e" scope="upgrade" affects="4986-bf86-beb4-13ac.profiles.Melee Weapons" join="" arg="+0"/>
                <modifier type="replace" field="3254-9fe6-d824-513e" scope="upgrade" affects="982b-de77-dd2d-d9bd.profiles.Melee Weapons" join="" arg="+0"/>
                <modifier type="increment" value="1" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" position="-1"/>
                <modifier type="replace" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" join="" arg="+0"/>
                <modifier type="add" value="982b-de77-dd2d-d9bd" field="category" scope="upgrade" join="" arg="+0" affects="4986-bf86-beb4-13ac"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Noctilith Armament upgrade" hidden="false" id="d36e-d497-6068-1b83">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="roster" shared="true" id="5304-c783-7cd3-9220" includeChildSelections="true"/>
            <constraint type="min" value="0" field="selections" scope="root-entry" shared="true" id="2e15-6683-fff6-d21d" includeChildSelections="true"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="true" field="hidden">
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="root-entry" childId="7499-0c7d-efd2-d306" shared="true" includeChildSelections="true"/>
                    <condition type="notInstanceOf" value="1" field="selections" scope="upgrade" childId="ccdd-3987-11ed-90cd" shared="true" includeChildSelections="false"/>
                  </conditions>
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="d36e-d497-6068-1b83" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="d36e-d497-6068-1b83" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="instanceOf" value="1" field="selections" scope="upgrade" childId="c13c-1717-f8a8-a8df" shared="true" includeChildSelections="false"/>
                        <condition type="lessThan" value="1" field="selections" scope="upgrade" childId="d36e-d497-6068-1b83" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
              </conditionGroups>
            </modifier>
            <modifier type="set" value="1" field="2e15-6683-fff6-d21d">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="root-entry" childId="7499-0c7d-efd2-d306" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
            <modifier type="add" value="c13c-1717-f8a8-a8df" field="category" join=", " scope="upgrade"/>
          </modifiers>
          <modifierGroups>
            <modifierGroup type="and">
              <modifiers>
                <modifier type="append" value="Noctilith Armament" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons"/>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
        </selectionEntry>
      </selectionEntries>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="lessThan" value="1" field="forces" scope="roster" childId="cac3-71d1-ea4b-795d" shared="true" includeChildSelections="true" includeChildForces="true"/>
                <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1dce-7584-846f-e698" includeChildSelections="false"/>
      </constraints>
    </selectionEntryGroup>
    <selectionEntryGroup name="Boarding Actions Enhancements" id="5a79-2c0b-66e4-2122" hidden="false">
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Close-quarters Killer" hidden="false" id="3180-1582-d15c-fb6f">
          <profiles>
            <profile name="Close-quarters Killer" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="73af-ab1f-6d21-3645">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time the bearer makes a melee attack, you can re-roll the Wound roll.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Expert Breacher" hidden="false" id="4952-6a30-3d10-3de9">
          <profiles>
            <profile name="Expert Breacher" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="1cb3-0d95-5d5b-d715">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer&apos;s unit can attempt to operate a Hatchway at the start or end of the Move Units step of your Movement phase. The bearer&apos;s unit cannot attempt to operate more than one Hatchway per turn.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Peerless Leader" hidden="false" id="4de4-9fb2-35cb-f5ad">
          <profiles>
            <profile name="Peerless Leader" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="bbc6-1deb-3d70-0fdd">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Once per battle round, the bearer can be targeted with the Battlefield Command Stratagem for 0CP, even if you have already targeted a different unit with that Stratagem this phase.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Personal Teleporter" hidden="false" id="f23e-54e8-e8e7-c789">
          <profiles>
            <profile name="Personal Teleporter" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="3875-c0db-7439-0466">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">The bearer has the Deep Strike ability.</characteristic>
              </characteristics>
            </profile>
          </profiles>
          <infoLinks>
            <infoLink name="Deep Strike" id="1845-7a49-adf7-a878" hidden="false" type="rule" targetId="7cb5-dd6b-dd87-ad3b"/>
          </infoLinks>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Superior Boarding Tactics" hidden="false" id="d63a-df06-dfed-ce99">
          <profiles>
            <profile name="Superior Boarding Tactics" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="5872-2ad1-05b9-7a8b">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">You start the battle with 2CP.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Trademark Weapon" hidden="false" id="69c3-5579-d475-e5a5">
          <profiles>
            <profile name="Trademark Weapon" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="ecd2-a98c-6bc2-7276">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">When you select this Enhancement, select one ranged weapon equipped by the bearer (excluding Torrent weapons) and make a note of this on your Army Roster. Add 1 to the Strength and Damage characteristics of that weapon.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
      </selectionEntries>
      <comment>Boarding Actions content</comment>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditions>
            <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntryGroup>
    <selectionEntryGroup name="Breaching Operation Enhancements" id="fc3b-5a53-47b1-4b2d" hidden="false">
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Paralysing Assault" hidden="false" id="cfe1-3457-9fa3-aed9">
          <profiles>
            <profile name="Paralysing Assault" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="61f1-6a68-83eb-c57c">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">In your Movement phase, when the bearer is selected to move, at the start or the end of that move if the bearer is within 1&quot; of a Weakened Wall that has not been breached, it can use this Enhancement. If it does so, each enemy unit that is on the opposite side of and visible to that Weakened Wall is stunned. Each time a unit is stunned, until the end of the turn, that unit cannot fire Overwatch and each time a model in that unit makes an attack, subtract 1 from the Hit roll.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Breaching Charges" hidden="false" id="268a-88b3-a5c1-fd98">
          <profiles>
            <profile name="Breaching Charges" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="0f42-46a6-5b4f-9252">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">In your Movement phase, when the bearer is selected to move, at the start or the end of that move if the bearer is within 1&quot; of a Weakened Wall that has not been breached, it can use this Enhancement. If it does so, that Weakened Wall&apos;s Vulnerable Section is destroyed. In addition, each unit that is on the opposite side of that Weakened Wall and is visible to and within 6&quot; of it suffers 1 mortal wound.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Spoor Seeker" hidden="false" id="7270-0ae0-e331-d15f">
          <profiles>
            <profile name="Spoor Seeker" typeId="9cc3-6d83-4dd3-9b64" typeName="Abilities" hidden="false" id="965d-bce2-021d-f3e2">
              <characteristics>
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">In your Movement phase, when the bearer is selected to move, at the start or the end of that move if the bearer is within 1&quot; of a Weakened Wall that has not been breached, it can use this Enhancement. If it does so, select one enemy unit that is on the opposite side of and visible to that Weakened Wall. Until the end of the turn, each time a friendly model makes an attack against that enemy unit, add 1 to the Hit roll and add 1 to the Wound roll.</characteristic>
              </characteristics>
            </profile>
          </profiles>
        </selectionEntry>
      </selectionEntries>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="or">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildSelections="true"/>
                <condition type="lessThan" value="1" field="selections" scope="roster" childId="f3ef-6eb6-31d1-8d0d" shared="true" includeChildSelections="true" includeChildForces="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <comment>Boarding Actions content</comment>
    </selectionEntryGroup>
  </sharedSelectionEntryGroups>
</gameSystem>
