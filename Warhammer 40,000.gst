<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem xmlns="http://www.battlescribe.net/schema/gameSystemSchema" id="sys-352e-adc2-7639-d6a9" name="Warhammer 40,000 10th Edition" revision="44" battleScribeVersion="2.03" type="gameSystem">
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
    <categoryEntry id="c619-2086-bbcf-69c9" name="Fly" hidden="false"/>
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
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <constraints>
        <constraint type="max" value="-1" field="51b2-306e-1021-d207" scope="roster" shared="true" id="dee8-c245-3c3c-86b6" includeChildSelections="true" includeChildForces="true" negative="false"/>
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
        <modifier type="set" value="Brood Brothers" field="name">
          <conditions>
            <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="3bdf-a114-5035-c6ac" shared="true" includeChildSelections="true" includeChildForces="true"/>
          </conditions>
        </modifier>
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
    <forceEntry name="Boarding Action" hidden="true" id="1d6e-2579-8e7f-1ed4">
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
      </categoryLinks>
    </forceEntry>
    <forceEntry name="Crusade Force" id="cac3-71d1-ea4b-795d" hidden="false">
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
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </selectionEntry>
            <selectionEntry id="baf8-997f-e323-a090" name="2. Strike Force (2000 Point limit)" hidden="false" collective="false" import="true" type="upgrade">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </selectionEntry>
            <selectionEntry id="4204-82d0-908c-a62a" name="3. Onslaught (3000 Point limit)" hidden="false" collective="false" import="true" type="upgrade">
              <costs>
                <cost name="pts" typeId="51b2-306e-1021-d207" value="0"/>
              </costs>
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="instanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="4. Boarding Patrol (500 Point Limit)" hidden="false" id="21b-48a5-24c-152c">
              <modifiers>
                <modifier type="set" value="true" field="hidden">
                  <conditions>
                    <condition type="notInstanceOf" value="1" field="selections" scope="force" childId="1d6e-2579-8e7f-1ed4" shared="true" includeChildForces="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </selectionEntry>
          </selectionEntries>
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
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Legends" hidden="false" id="9ed-cbf4-bfe5-90bf">
      <categoryLinks>
        <categoryLink targetId="4ac9-fd30-1e3d-b249" id="8f35-ad49-afb5-715" primary="true" name="Configuration"/>
      </categoryLinks>
      <constraints>
        <constraint field="selections" scope="force" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="7cbd-24e3-bacb-1eb1" type="min"/>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="51d8-e3c2-867-5eb"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1f32-5aaa-603e-fed1"/>
      </constraints>
      <modifiers>
        <modifier type="set" field="7cbd-24e3-bacb-1eb1" value="0"/>
        <modifier type="set" field="51d8-e3c2-867-5eb" value="0"/>
        <modifier type="set" value="Legends are visible" field="name"/>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Unaligned Forces" hidden="false" id="2973-ea51-7f8d-5403">
      <constraints>
        <constraint field="selections" scope="force" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="756f-43f7-60e3-d93b" type="min"/>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="2caa-2d0e-2ef7-2245"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ed3f-a6a6-a555-2a07"/>
      </constraints>
      <modifiers>
        <modifier type="set" field="756f-43f7-60e3-d93b" value="0"/>
        <modifier type="set" field="2caa-2d0e-2ef7-2245" value="0"/>
        <modifier type="set" value="Unaligned Forces are visible" field="name"/>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Show Unaligned Fortifications" hidden="false" id="e916-2cf4-a49d-b8c4">
      <constraints>
        <constraint field="selections" scope="force" value="1" percentValue="false" shared="true" includeChildSelections="false" includeChildForces="false" id="555c-624d-1099-249b" type="min"/>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="d690-2eb1-642-a72a"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="355a-61e4-abb8-b97b"/>
      </constraints>
      <modifiers>
        <modifier type="set" field="555c-624d-1099-249b" value="0"/>
        <modifier type="set" field="d690-2eb1-642-a72a" value="0"/>
        <modifier type="set" value="Unaligned Fortifications are visible" field="name"/>
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
        <selectionEntry type="upgrade" import="true" name="Requisition Points" hidden="false" id="ce7f-9d46-52a9-947c" defaultAmount="5" sortIndex="2">
          <constraints>
            <constraint type="max" value="10" field="selections" scope="parent" shared="true" id="b320-bdb5-fe91-6078" includeChildSelections="false"/>
          </constraints>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Battle Tally" hidden="false" id="3dd5-2e5a-a042-6595" sortIndex="3"/>
        <selectionEntry type="upgrade" import="true" name="Victories" hidden="false" id="1d15-6e78-ba49-ace9" sortIndex="4"/>
        <selectionEntry type="upgrade" import="true" name="Supply Limit" hidden="false" id="4213-a51d-bffe-87dc" sortIndex="1">
          <constraints>
            <constraint type="min" value="1000" field="selections" scope="parent" shared="true" id="6be6-c41c-ea86-298a" includeChildSelections="false"/>
          </constraints>
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
  </sharedSelectionEntries>
  <sharedRules>
    <rule id="8bf7-8812-923d-29e4" name="Pistol" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [PISTOL] in their profile are known as Pistols. If a unit contains any models equipped with Pistols, that unit is eligible to shoot in its controlling player’s Shooting phase even while it is within Engagement Range of one or more enemy units. When such a unit is selected to shoot, it can only resolve attacks using its Pistols and can only target one of the enemy units it is within Engagement Range of. In such circumstances, a Pistol can target an enemy unit even if other friendly units are within Engagement Range of the same enemy unit. 

If a model is equipped with one or more Pistols, unless it is a MONSTER or VEHICLE model, it can either shoot with its Pistols or with all of its other ranged weapons. Declare whether such a model will shoot with its Pistols or its other ranged weapons before selecting targets.</description>
    </rule>
    <rule id="8367-374c-f87-c627" name="Hazardous" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with [HAZARDOUS] in their profile are known as Hazardous weapons. Each time a unit is selected to shoot or fight, after that unit has resolved all of its attacks, for each Hazardous weapon that targets were selected for when resolving those attacks, that unit must take one Hazardous test. To do so, roll one D6: on a 1, that test is failed. For each failed test you must resolve the following sequence (resolve each failed test one at a time): 

■ If possible, select one model in that unit that has lost one or more wounds and is equipped with one or more Hazardous weapons. 
■ Otherwise, if possible, select one model in that unit (excluding CHARACTER models) equipped with one or more Hazardous weapons. 
■ Otherwise, select one CHARACTER model in that unit equipped with one or more Hazardous weapons. 

If a model was selected, that unit suffers 3 mortal wounds and when allocating those mortal wounds, they must be allocated to the selected model. 

If a unit from a player’s army is selected as the target of the Fire Overwatch Stratagem in their opponent’s Charge phase, any mortal wounds inflicted by Hazardous tests are allocated after the charging unit has ended its Charge move.</description>
    </rule>
    <rule id="b4dd-3e1f-41cb-218f" name="Leader" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>While a Bodyguard unit contains a Leader, it is known as an Attached unit and, with the exception of rules that are triggered when units are destroyed (pg 12), it is treated as a single unit for all rules purposes. Each time an attack targets an Attached unit, until the attacking unit has resolved all of its attacks, you must use the Toughness characteristic of the Bodyguard models in that unit, even if a Leader in that unit has a different Toughness characteristic. Each time an attack successfully wounds an Attached unit, that attack cannot be allocated to a Character model in that unit, even if that Character model has lost one or more wounds or has already had attacks allocated to it this phase. As soon as the last Bodyguard model in an Attached unit has been destroyed, any attacks made against that unit that have yet to be allocated can then be allocated to Character models in that unit.

Each time the last model in a Bodyguard unit is destroyed, each CHARACTER unit that is part of that Attached unit becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks. 

Each time the last model in a CHARACTER unit that is attached to a Bodyguard unit is destroyed and there is not another CHARACTER unit attached, that Attached unit’s Bodyguard unit becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks. 

Each time a unit that is part of an Attached unit is destroyed, it does not have the keywords of any other units that make up that Attached unit (unless it has those keywords on its own datasheet) for the purposes of any rules that would be triggered when that unit is destroyed.</description>
    </rule>
    <rule id="be1e-ac8e-1e2c-3528" name="Devastating Wounds" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with [DEVASTATING WOUNDS] in their profile are known as Devastating Wounds weapons. Each time an attack is made with such a weapon, if that attack scores a Critical Wound, no saving throw of any kind can be made against that attack (including invulnerable saving throws). Such attacks are only allocated to models after all other attacks made by the attacking unit have been allocated and resolved. After that attack is allocated and after any modifiers are applied, it inflicts a number of mortal wounds on the target equal to the Damage characteristic of that attack, instead of inflicting damage normally.</description>
      <alias>DEVASTATING WOUNDS</alias>
    </rule>
    <rule id="fc8a-8c24-bae9-cc1c" name="Assault" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [ASSAULT] in their profile are known as Assault weapons. If a unit that Advanced this turn contains any models equipped with Assault weapons, it is still eligible to shoot in this turn’s Shooting phase. When such a unit is selected to shoot, you can only resolve attacks using Assault weapons its models are equipped with.</description>
    </rule>
    <rule id="115b-79dc-f723-d761" name="Extra Attacks" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with [EXTRA ATTACKS] in their profile are known as Extra Attacks weapons. Each time the bearer of one or more Extra Attacks weapons fights, it makes attacks with each of the Extra Attacks melee weapons it is equipped with and it makes attacks with one of the melee weapons it is equipped with that does not have the [EXTRA ATTACKS] ability (if any). The number of attacks made with an Extra Attacks weapon cannot be modified by other rules, unless that weapon’s name is explicitly specified in that rule.</description>
    </rule>
    <rule id="cf93-ad4d-2f08-a79d" name="Twin-linked" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [TWIN-LINKED] in their profile are known as Twin-linked weapons. Each time an attack is made with such a weapon, you can re-roll that attack’s Wound roll.</description>
    </rule>
    <rule id="4111-82e3-9444-e942" name="Anti-" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with [ANTI-KEYWORD X+] in their profile are known as Anti weapons. Each time an attack is made with such a weapon against a target with the keyword after the word ‘Anti-’, an unmodified Wound roll of ‘x+’ scores a Critical Wound.</description>
    </rule>
    <rule id="1897-c22c-9597-12b1" name="Sustained Hits" publicationId="48fc-15aa-b307-9443" page="28" hidden="false">
      <description>Weapons with [SUSTAINED HITS X] in their profile are known as Sustained Hits weapons. Each time an attack is made with such a weapon, if a Critical Hit is rolled, that attack scores a number of additional hits on the target as denoted by ‘x’</description>
      <alias>SUSTAINED HITS</alias>
    </rule>
    <rule id="1202-10a8-78e9-4c67" name="Heavy" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with [HEAVY] in their profile are known as Heavy weapons. Each time an attack is made with such a weapon, if the attacking model’s unit Remained Stationary this turn, add 1 to that attack’s Hit roll.</description>
    </rule>
    <rule id="7cdb-fb99-44a9-8849" name="Melta" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with [MELTA X] in their profile are known as Melta weapons. Each time an attack made with such a weapon targets a unit within half that weapon’s range, that attack’s Damage characteristic is increased by the amount denoted by ‘x’.</description>
    </rule>
    <rule id="9bf4-280f-bbe2-6fbb" name="Feel No Pain" publicationId="48fc-15aa-b307-9443" page="23" hidden="false">
      <description>Some models have &apos;Feel No Pain x+&apos; listed in their abilities. Each time a model with this ability suffers damage and so would lose a wound (including wounds lost due to mortal wounds), roll one D6: if the result is greater than or equal to the number denoted by &apos;x: that wound is ignored and is not lost. If a model has more than one Feel No Pain ability, you can only use one of those abilities each time that model suffers damage and so would lose a wound.</description>
    </rule>
    <rule id="6c1f-1cf7-ff25-c99e" name="Blast" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with [BLAST] in their profile are known as Blast weapons, and they make a random number of attacks. Each time you determine how many attacks are made with a Blast weapon, add 1 to the result for every five models that were in the target unit when you selected it as the target (rounding down). Blast weapons can never be used to make attacks against a unit that is within Engagement Range of one or more units from the attacking model’s army (including its own unit).</description>
    </rule>
    <rule id="9143-31ae-e0a6-6007" name="Precision" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with [PRECISION] in their profile are known as Precision weapons. Each time an attack made with such a weapon successfully wounds an Attached unit, if a Character model in that unit is visible to the attacking model, the attacking model’s player can choose to have that attack allocated to that Character model instead of following the normal attack sequence.</description>
    </rule>
    <rule id="4ddd-4e29-acdd-5e6d" name="Indirect Fire" publicationId="48fc-15aa-b307-9443" page="26" hidden="false">
      <description>Weapons with [INDIRECT FIRE] in their profile are known as Indirect Fire weapons, and attacks can be made with them even if the target is not visible to the attacking model. These attacks can destroy enemy models in a target unit even though none may have been visible to the attacking unit when you selected that target.


If no models in a target unit are visible to the attacking unit when you select that target, then each time a model in the attacking unit makes an attack against that target using an Indirect Fire weapon, subtract 1 from that attack’s Hit roll, an unmodified Hit roll of 1-3 always fails, and the target has the Benefit of Cover against that attack. Weapons with the [TORRENT] ability cannot be fired using the [INDIRECT FIRE] ability.</description>
    </rule>
    <rule id="2ebc-abdf-8129-6c57" name="Lance" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [LANCE] in their profile are known as Lance weapons. Each time an attack is made with such a weapon, if the bearer made a Charge move this turn, add 1 to that attack’s Wound roll.</description>
    </rule>
    <rule id="d1d1-611e-5191-1095" name="Lethal Hits" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [LETHAL HITS] in their profile are known as Lethal Hits weapons. Each time an attack is made with such a weapon, a Critical Hit automatically wounds the target.</description>
      <alias>LETHAL HITS</alias>
    </rule>
    <rule id="4640-43e7-30b-215a" name="Ignores Cover" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [IGNORES COVER] in their profile are known as Ignores Cover weapons. Each time an attack is made with such a weapon, the target cannot have the Benefit of Cover against that attack.</description>
    </rule>
    <rule id="c5c8-8b58-b8b6-7786" name="Rapid Fire" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [RAPID FIRE X] in their profile are known as Rapid Fire weapons. Each time such a weapon targets a unit within half that weapon’s range, the Attacks characteristic of that weapon is increased by the amount denoted by ‘x’.</description>
    </rule>
    <rule id="5edf-d619-23e0-9b56" name="Torrent" publicationId="48fc-15aa-b307-9443" page="25" hidden="false">
      <description>Weapons with [TORRENT] in their profile are known as Torrent weapons. Each time an attack is made with such a weapon, that attack automatically hits the target.</description>
    </rule>
    <rule id="ada6-bac1-ffe0-d6f7" name="Scouts" publicationId="48fc-15aa-b307-9443" page="39" hidden="false">
      <description>Some units have ‘Scouts x&quot;’ listed in their abilities. If every model in a unit has this ability, then at the start of the first battle round, before the first turn begins, it can make a Normal move of up to x&quot;, with the exception that, while making that move, the distance moved by each model in that unit can be greater than that model&apos;s Move characteristic, as long as it is not greater than x&quot;. 

DEDICATED TRANSPORT models can make use of any Scouts x&quot; ability listed in their abilities, or a Scouts x&quot; ability that a unit that starts the battle embarked within that DEDICATED TRANSPORT  model has (provided only models with this ability are embarked within that Dedicated Transport model), regardless of how that embarked unit gained this ability (e.g. listed in their abilities, conferred by an Enhancement or by an attached Character, etc.). 

A unit that moves using this ability must end that move more than 9&quot; horizontally away from all enemy models. If both players have units that can do this, the player who is taking the first turn moves their units first.</description>
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
      <description>Each time a model with this ability makes a Normal, Advance or Fall Back move, it can move through models (excluding TITANIC models) and sections of terrain features that are 4&quot; or less in height. 
When doing so:
- It can move within Engagement Range of enemy models, but cannot end that move within Engagement Range of them.
- It can also move through sections of terrain features that are more than 4&quot; in height, but if it does, after it has moved, roll one D6: on a 1, that model is Battle-shocked.</description>
    </rule>
    <rule id="a8a0-8fe7-898-e0f3" name="Lone Operative" publicationId="48fc-15aa-b307-9443" page="19" hidden="false">
      <description>Unless part of an Attached unit, this unit can only be selected as the target of a ranged attack if the attacking model is within 12&quot;.</description>
    </rule>
    <rule id="eec5-5f54-9c03-c305" name="Hover" publicationId="48fc-15aa-b307-9443" page="53" hidden="false">
      <description>Some AIRCRAFT models have &apos;Hover&apos; listed in their abilities. When you are instructed to Declare Battle Formations, before doing anything else, you must first declare which models from your army with this ability will be in Hover mode.

If a model is in Hover mode,  then until the end of the battle, its Move characteristic is changed to 20&quot;, it loses the AIRCRAFT keyword and it loses all associated rules for being an AlRCRAFT model. Models in Hover mode do not start the battle in Reserves, but you can choose to place them into Strategic Reserves following the normal rules if you wish.</description>
    </rule>
    <rule id="24-c886-e8ba-5a89" name="Fights First" publicationId="48fc-15aa-b307-9443" page="32" hidden="false">
      <description>Units with this ability that are eligible to fight do so in the Fights First step, provided every model in the unit has this ability.</description>
    </rule>
    <rule id="e9c4-2bb8-12ee-cd1b" name="Psychic" publicationId="48fc-15aa-b307-9443" page="38" hidden="false">
      <description>Some weapons and abilities can only be used by PSYKERS. Such weapons and abilities are tagged with the word &apos;Psychic&apos;. If a Psychic weapon or ability causes any unit to suffer one or more wounds, each of those wounds is considered to have been inflicted by a Psychic Attack.</description>
    </rule>
    <rule id="13b2-6518-dab3-7ea1" name="Firing Deck" page="17" hidden="false">
      <description>Some TRANSPORT models have ‘Firing Deck x’ listed in their abilities. Each time such a model is selected to shoot in the Shooting phase, you can select up to ‘x’ models embarked within it whose units have not already shot this phase. Then, for each of those embarked models, you can select one ranged weapon that embarked model is equipped with (excluding weapons with the [ONE SHOT] ability). Until that TRANSPORT model has resolved all of its attacks, it counts as being equipped with all of the weapons you selected in this way, in addition to its other weapons. Until the end of the phase, those selected models’ units are not eligible to shoot.</description>
    </rule>
    <rule id="cd26-1611-860a-91e4" name="One Shot" hidden="false">
      <description>The bearer can only shoot with this weapon once per battle.</description>
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
                            <condition type="equalTo" value="6" field="75bb-ded1-c86d-bdf0" scope="model-or-unit" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="1511-18fe-f51e-7b9d" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="6" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="equalTo" value="3" field="75bb-ded1-c86d-bdf0" scope="model-or-unit" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="1511-18fe-f51e-7b9d" shared="true" includeChildSelections="true"/>
                            <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="3" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                        <conditionGroup type="and">
                          <conditions>
                            <condition type="instanceOf" value="1" field="selections" scope="ancestor" childId="9cfd-1c32-585f-7d5c" shared="true" includeChildSelections="true"/>
                            <condition type="equalTo" value="6" field="75bb-ded1-c86d-bdf0" scope="model-or-unit" childId="any" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="6" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="lessThan" value="1" field="selections" scope="model" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="1" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="2" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="2" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="4" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="3" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="6" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="4" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="8" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="5" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="10" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="lessThan" value="1" field="selections" scope="self" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
                  </conditions>
                </conditionGroup>
                <conditionGroup type="and">
                  <conditions>
                    <condition type="equalTo" value="6" field="selections" scope="model-or-unit" childId="d1a5-4297-168b-11cd" shared="true" includeChildSelections="true" includeChildForces="false"/>
                    <condition type="equalTo" value="12" field="selections" scope="model-or-unit" childId="f9da-852a-d7f0-92e9" shared="true" includeChildSelections="true" includeChildForces="false"/>
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
                <modifier type="append" value="Armour Piercing" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="128d-c573-273f-47b5" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="decrement" value="1" field="9ead-8a10-520-de15" scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="128d-c573-273f-47b5" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Armour Piercing" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="128d-c573-273f-47b5" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="decrement" value="1" field="41a0-1301-112a-e2f2" scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="128d-c573-273f-47b5" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
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
                <modifier type="append" value="Brutal" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="c5fb-58f5-2d2f-cc09" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="2229-f494-25db-c5d3" scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="c5fb-58f5-2d2f-cc09" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="ab33-d393-96ce-ccba" scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="c5fb-58f5-2d2f-cc09" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Brutal" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="c5fb-58f5-2d2f-cc09" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
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
                <modifier type="append" value="Finely Balanced" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="decrement" value="1" field="94d-8a98-cf90-183e" scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="decrement" value="1" field="95d1-95f-45b4-11d6" scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Finely Balanced" field="annotation" join=", " scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="floor" value="2" field="95d1-95f-45b4-11d6" scope="upgrade" affects="self.entries.profiles.Melee Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="floor" value="2" field="94d-8a98-cf90-183e" scope="upgrade" affects="self.entries.profiles.Ranged Weapons">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="a925-2f50-1580-0f5c" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
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
                <modifier type="append" value="Heirloom" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="3bb-c35f-f54-fb08" scope="upgrade" affects="profiles.Ranged Weapons" position="-1">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" position="-1">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Heirloom" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="replace" field="3bb-c35f-f54-fb08" scope="upgrade" affects="profiles.Ranged Weapons" arg="+0">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="replace" field="2337-daa1-6682-b110" scope="upgrade" affects="profiles.Melee Weapons" arg="+0">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="2801-9f1c-645d-cb3d" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
              </modifiers>
            </modifierGroup>
          </modifierGroups>
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
                <modifier type="append" value="Master-worked" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="profiles.Ranged Weapons" position="-1">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Master-worked" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="increment" value="1" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" position="-1">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="replace" field="a354-c1c8-a745-f9e3" scope="upgrade" affects="profiles.Ranged Weapons" join="" arg="+0">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="replace" field="3254-9fe6-d824-513e" scope="upgrade" affects="profiles.Melee Weapons" join="" arg="+0">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="584b-5fa7-a3c3-942e" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
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
                <characteristic name="Description" typeId="9b8f-694b-e5e-b573">Each time a Critical Wound is scored for an attack made with this weapon, that attack has the [PRECISION] ability.</characteristic>
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
                <modifier type="append" value="Seeping Poisons" field="annotation" join=", " scope="upgrade" affects="profiles.Ranged Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="d327-a8ea-20de-37f4" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Lethal Hits" field="7f1b-8591-2fcf-d01c" scope="upgrade" affects="profiles.Ranged Weapons" position="-1" join=", ">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="d327-a8ea-20de-37f4" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Seeping Poisons" field="annotation" join=", " scope="upgrade" affects="profiles.Melee Weapons">
                  <conditions>
                    <condition type="greaterThan" value="0" field="selections" scope="upgrade" childId="d327-a8ea-20de-37f4" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
                <modifier type="append" value="Lethal Hits" field="893f-9000-ccf7-648e" scope="upgrade" affects="profiles.Melee Weapons" position="-1" join=", ">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="upgrade" childId="d327-a8ea-20de-37f4" shared="true" includeChildSelections="true"/>
                  </conditions>
                </modifier>
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
                    <modifier type="append" value="Archeotech Power Cell" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="2" field="e703-ecb6-5ce7-aec1" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
                    <modifier type="append" value="Obdurate Obedience" field="annotation" join=", " scope="model" affects="self.entries.recursive.profiles.Unit"/>
                    <modifier type="increment" value="1" field="bef7-942a-1a23-59f8" scope="model" affects="self.entries.recursive.profiles.Unit" join=", "/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
                    <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true" includeChildSelections="false" includeChildForces="false"/>
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
      <entryLinks>
        <entryLink import="true" name="Tyrannic War Crusade Relics" hidden="false" id="97cf-1456-2ee6-6f02" type="selectionEntryGroup" targetId="5a5c-df7d-ba6b-5441"/>
      </entryLinks>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                      </conditions>
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="faa2-8145-18a4-34c1" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="79d5-885d-8cc2-f885" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                      </conditions>
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="8791-d292-d3df-69a2" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="79d5-885d-8cc2-f885" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                      </conditions>
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="4556-4f10-f8fe-640c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="8791-d292-d3df-69a2" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                      </conditions>
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="d441-8e0d-f984-52ee" shared="true" includeChildSelections="true"/>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="ab52-bc6a-1099-5000" shared="true" includeChildSelections="true"/>
                          </conditions>
                          <conditionGroups>
                            <conditionGroup type="and">
                              <conditions>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="8791-d292-d3df-69a2" shared="true"/>
                                <condition type="lessThan" value="1" field="selections" scope="parent" childId="faa2-8145-18a4-34c1" shared="true"/>
                              </conditions>
                            </conditionGroup>
                          </conditionGroups>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="and">
                      <conditions>
                        <condition type="lessThan" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                      </conditions>
                      <conditionGroups>
                        <conditionGroup type="or">
                          <conditions>
                            <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="4556-4f10-f8fe-640c" shared="true" includeChildSelections="true"/>
                            <condition type="lessThan" value="1" field="selections" scope="parent" childId="faa2-8145-18a4-34c1" shared="true"/>
                          </conditions>
                        </conditionGroup>
                      </conditionGroups>
                    </conditionGroup>
                  </conditionGroups>
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
              <conditionGroups>
                <conditionGroup type="or">
                  <conditions>
                    <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="7767-9b46-61a3-c62a" shared="true" includeChildSelections="true"/>
                    <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="a4cc-8fae-4ffa-828a" shared="true" includeChildSelections="true"/>
                  </conditions>
                </conditionGroup>
              </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="8b22-21b7-9d42-ed41" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="d241-419d-402c-8a4c" shared="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="31bd-ce57-db23-cd21" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="0631-30ea-dc30-6668" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="d241-419d-402c-8a4c" shared="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="31bd-ce57-db23-cd21" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="0631-30ea-dc30-6668" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="d241-419d-402c-8a4c" shared="true"/>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="8b22-21b7-9d42-ed41" shared="true" includeChildSelections="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="1473-e060-09f0-2261" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="0631-30ea-dc30-6668" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="a2b9-1412-57b8-d6f8" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="0631-30ea-dc30-6668" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="a4b0-aae0-e3b9-d952" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="31bd-ce57-db23-cd21" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="14d4-1e97-4302-1654" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="31bd-ce57-db23-cd21" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="702d-9520-9430-7269" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="8b22-21b7-9d42-ed41" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
                <modifier type="set" value="true" field="hidden">
                  <conditionGroups>
                    <conditionGroup type="or">
                      <conditions>
                        <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="ee3c-b45a-e693-96f5" shared="true" includeChildSelections="true"/>
                        <condition type="lessThan" value="1" field="selections" scope="parent" childId="8b22-21b7-9d42-ed41" shared="true"/>
                      </conditions>
                    </conditionGroup>
                  </conditionGroups>
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
            <modifier type="set" value="1" field="2255-b8fc-34ba-43b6">
              <conditions>
                <condition type="atLeast" value="1" field="selections" scope="model-or-unit" childId="fe0b-a773-b244-d6a3" shared="true" includeChildSelections="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <constraints>
            <constraint type="min" value="0" field="selections" scope="parent" shared="true" id="2255-b8fc-34ba-43b6" includeChildSelections="false"/>
            <constraint type="max" value="3" field="selections" scope="parent" shared="true" id="d674-520e-d71b-1586" includeChildSelections="false"/>
          </constraints>
        </selectionEntryGroup>
      </selectionEntryGroups>
      <modifiers>
        <modifier type="set" value="true" field="hidden">
          <conditionGroups>
            <conditionGroup type="and">
              <conditions>
                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="9693-cf84-fe69-37a9" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="6dda-e157-334d-e93a" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="cf47-a0d7-7207-29dc" shared="true"/>
                <condition type="notInstanceOf" value="1" field="selections" scope="ancestor" childId="14a0-40c9-2748-ae6e" shared="true"/>
              </conditions>
            </conditionGroup>
          </conditionGroups>
        </modifier>
      </modifiers>
      <comment>Crusade content</comment>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="31" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
                        <condition type="lessThan" value="51" field="a623-fe74-1d33-cddf" scope="ancestor" childId="any" shared="true" includeChildSelections="true"/>
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
    </selectionEntryGroup>
  </sharedSelectionEntryGroups>
</gameSystem>
